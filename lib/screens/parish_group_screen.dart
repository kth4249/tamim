import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tamim/models/schedule.dart';
import 'package:tamim/models/schedule_event.dart';
import 'package:tamim/providers/calendar_provider.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/schedule_provider.dart';
import 'package:tamim/screens/group_management_screen.dart';
import 'package:tamim/services/storage_service.dart';
import 'package:tamim/widgets/common_calendar.dart';
import 'package:tamim/widgets/custom_scaffold.dart';
import 'package:tamim/widgets/schedule_create_sheet.dart';
import '../theme/app_theme.dart';

class ParishGroupScreen extends StatefulWidget {
  const ParishGroupScreen({super.key, required this.id});

  final int id;

  @override
  State<ParishGroupScreen> createState() => _ParishGroupScreenState();
}

class _ParishGroupScreenState extends State<ParishGroupScreen> {
  final DateTime _firstDay = DateTime.now().subtract(const Duration(days: 365));
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 365));
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  int _selectedIndex = 0;

  @override
  void initState() {
    context.read<ParishGroupProvider>().fetchData(widget.id);
    context.read<ScheduleProvider>().fetchSchedules(widget.id);
    super.initState();
  }

  List<ScheduleEvent> _getSchedulesForDay(DateTime day) {
    final map = context.watch<ScheduleProvider>().schedulesByDate;
    final key = DateTime(day.year, day.month, day.day);
    return map[key] ?? [];
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    final volnteerEvents =
        context.read<ParishGroupProvider>().groupByVolunteerEvents[day] ?? [];
    final scheduleEvents = _getSchedulesForDay(day);
    return [...volnteerEvents, ...scheduleEvents];
  }

  void _showCreateScheduleDialog(DateTime selectedDay) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ScheduleCreateSheet(
        groupId: widget.id,
        selectedDate: selectedDay,
      ),
    );
  }

  void _showEditScheduleDialog(ScheduleEvent event) {
    final schedule = Schedule(
      id: event.id,
      groupId: event.parishGroup.id,
      userId: event.tamimUser.id,
      scheduleDatetime: event.scheduleDatetime,
      scheduleName: event.scheduleName,
      scheduleDesc: event.scheduleDesc,
      openChatUrl: event.openChatUrl,
      recruiteCount: event.recruiteCount,
      shareScope: event.shareScope,
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => ScheduleEditSheet(
        schedule: schedule,
      ),
    );
  }

  void _deleteSchedule(ScheduleEvent event) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('일정 삭제'),
        content: const Text('정말로 이 일정을 삭제하시겠습니까?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('취소')),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('삭제', style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    final schedule = Schedule(
      id: event.id,
      groupId: event.parishGroup.id,
      userId: event.tamimUser.id,
      scheduleDatetime: event.scheduleDatetime,
      scheduleName: event.scheduleName,
      scheduleDesc: event.scheduleDesc,
      openChatUrl: event.openChatUrl,
      recruiteCount: event.recruiteCount,
      shareScope: event.shareScope,
    );

    if (confirm == true) {
      await context.read<ScheduleProvider>().deleteSchedule(schedule);
    }
  }

  @override
  Widget build(BuildContext context) {
    final volunteers = context
        .read<ParishGroupProvider>()
        .groupByVolunteerEvents[_selectedDay];
    volunteers?.sort((a, b) => a.position.order.compareTo(b.position.order));
    final liturgicalEvents =
        context.watch<CalendarProvider>().liturgicalEvents[_selectedDay];

    List<Widget> slivers = [
      SliverAppBar(
        centerTitle: true,
        title: Text(
          context.watch<ParishGroupProvider>().parishGroup?.groupName ?? '',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          color: Colors.white,
          child: CommonCalendar(
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: _focusedDay,
            selectedDay: _selectedDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
          ),
        ),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 16)),
    ];

    if (volunteers != null) {
      slivers.add(
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Text('이 날 봉사자',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
      );
      slivers.add(
        SliverToBoxAdapter(
          child: SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: volunteers.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final volunteer = volunteers[index];
                return IntrinsicWidth(
                  // TODO: 성능 저하 우려가 있어 추후 개선
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(13),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.primaryColor.withAlpha(26),
                        backgroundImage:
                            const AssetImage('assets/images/profile.png'),
                      ),
                      title: Text(
                        volunteer.user != null
                            ? volunteer.user!.userInfo?.nickname ?? ''
                            : volunteer.anon!.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(volunteer.position.positionName),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
      slivers.add(const SliverToBoxAdapter(child: SizedBox(height: 16)));
    }

    if (liturgicalEvents != null) {
      slivers.add(
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Text('이 날의 전례',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ),
      );
      slivers.add(
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final event = liturgicalEvents[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(13),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.church_outlined,
                        color: AppTheme.primaryColor),
                    title: Text(event.summary,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle:
                        Text(event.description?.replaceAll('\\n', '\n') ?? ''),
                  ),
                );
              },
              childCount: liturgicalEvents.length,
            ),
          ),
        ),
      );
    }

    // ... 기존 slivers 코드 중간에 추가 ...
    // final schedules = _getSchedulesForDay(_selectedDay!);

    // slivers.add(
    //   SliverToBoxAdapter(
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           const Text('일정',
    //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    //           ElevatedButton.icon(
    //             onPressed: () => _showCreateScheduleDialog(_selectedDay!),
    //             icon: const Icon(Icons.add),
    //             label: const Text('일정 생성'),
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: AppTheme.primaryColor,
    //               foregroundColor: Colors.white,
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(8)),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    // if (schedules.isEmpty) {
    //   slivers.add(
    //     const SliverToBoxAdapter(
    //       child: Center(
    //         child: Padding(
    //           padding: EdgeInsets.symmetric(vertical: 32),
    //           child: Text('일정이 없습니다.', style: TextStyle(color: Colors.grey)),
    //         ),
    //       ),
    //     ),
    //   );
    // } else {
    //   slivers.add(
    //     SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         (context, index) {
    //           final schedule = schedules[index];
    //           return Card(
    //             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //             color: Colors.white,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(16),
    //             ),
    //             elevation: 3,
    //             child: Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Row(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Icon(Icons.event_note,
    //                           color: AppTheme.primaryColor, size: 22),
    //                       const SizedBox(width: 8),
    //                       Expanded(
    //                         child: Text(
    //                           schedule.scheduleName,
    //                           style: const TextStyle(
    //                             fontSize: 18,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black87,
    //                           ),
    //                         ),
    //                       ),
    //                       Container(
    //                         padding: const EdgeInsets.symmetric(
    //                             horizontal: 10, vertical: 4),
    //                         decoration: BoxDecoration(
    //                           color: AppTheme.primaryColor.withOpacity(0.08),
    //                           borderRadius: BorderRadius.circular(8),
    //                         ),
    //                         child: Text(
    //                           schedule.shareScope == '전체' ? '전체 공개' : '멤버만',
    //                           style: TextStyle(
    //                             color: AppTheme.primaryColor,
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w600,
    //                           ),
    //                         ),
    //                       ),
    //                       PopupMenuButton<String>(
    //                         onSelected: (value) {
    //                           if (value == 'edit') {
    //                             _showEditScheduleDialog(schedule);
    //                           } else if (value == 'delete') {
    //                             _deleteSchedule(schedule);
    //                           }
    //                         },
    //                         itemBuilder: (context) => [
    //                           const PopupMenuItem(
    //                               value: 'edit', child: Text('수정')),
    //                           const PopupMenuItem(
    //                               value: 'delete', child: Text('삭제')),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                   const SizedBox(height: 8),
    //                   Row(
    //                     children: [
    //                       Icon(Icons.access_time,
    //                           color: Colors.grey[600], size: 18),
    //                       const SizedBox(width: 4),
    //                       Text(
    //                         '${schedule.scheduleDatetime.year}.${schedule.scheduleDatetime.month.toString().padLeft(2, '0')}.${schedule.scheduleDatetime.day.toString().padLeft(2, '0')} '
    //                         '${schedule.scheduleDatetime.hour.toString().padLeft(2, '0')}:${schedule.scheduleDatetime.minute.toString().padLeft(2, '0')}',
    //                         style: const TextStyle(
    //                             fontSize: 14, color: Colors.black54),
    //                       ),
    //                       const Spacer(),
    //                       Icon(Icons.people_outline,
    //                           color: Colors.grey[600], size: 18),
    //                       const SizedBox(width: 4),
    //                       Text(
    //                         '모집 ${schedule.recruiteCount}명',
    //                         style: const TextStyle(
    //                             fontSize: 14, color: Colors.black54),
    //                       ),
    //                     ],
    //                   ),
    //                   if (schedule.scheduleDesc.isNotEmpty) ...[
    //                     const SizedBox(height: 10),
    //                     Text(
    //                       schedule.scheduleDesc,
    //                       style: const TextStyle(
    //                           fontSize: 15, color: Colors.black87),
    //                     ),
    //                   ],
    //                   if (schedule.openChatUrl.isNotEmpty) ...[
    //                     const SizedBox(height: 10),
    //                     GestureDetector(
    //                       onTap: () {
    //                         // TODO: url_launcher로 오픈채팅 이동 구현
    //                       },
    //                       child: Row(
    //                         children: [
    //                           Icon(Icons.chat_bubble_outline,
    //                               color: AppTheme.primaryColor, size: 18),
    //                           const SizedBox(width: 6),
    //                           Flexible(
    //                             child: Text(
    //                               schedule.openChatUrl,
    //                               style: const TextStyle(
    //                                 color: Colors.blue,
    //                                 decoration: TextDecoration.underline,
    //                                 fontSize: 14,
    //                               ),
    //                               overflow: TextOverflow.ellipsis,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                   const SizedBox(height: 12),
    //                   Row(
    //                     children: [
    //                       CircleAvatar(
    //                         radius: 13,
    //                         backgroundColor:
    //                             AppTheme.primaryColor.withOpacity(0.15),
    //                         child: Text(
    //                           (schedule.tamimUser.userInfo?.nickname ??
    //                                       schedule.tamimUser.name)
    //                                   .isNotEmpty
    //                               ? (schedule.tamimUser.userInfo?.nickname ??
    //                                   schedule.tamimUser.name)[0]
    //                               : '?',
    //                           style: TextStyle(
    //                             color: AppTheme.primaryColor,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(width: 8),
    //                       Text(
    //                         schedule.tamimUser.userInfo?.nickname ??
    //                             schedule.tamimUser.name,
    //                         style: const TextStyle(
    //                             fontSize: 13, color: Colors.black54),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //         childCount: schedules.length,
    //       ),
    //     ),
    //   );
    // }

    // slivers.add(const SliverToBoxAdapter(child: SizedBox(height: 24)));

    Widget currentScreen = CustomScrollView(
      slivers: slivers,
    );

    if (_selectedIndex == 1) {
      currentScreen = const GroupManagementScreen();
    }

    return CustomScaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       context.read<ParishGroupProvider>().reset();
      //       context.read<ScheduleProvider>().reset();
      //       context.pop();
      //     },
      //     icon: const Icon(Icons.arrow_back),
      //   ),
      //   centerTitle: true,
      //   title: Text(
      //     context.watch<ParishGroupProvider>().parishGroup?.groupName ?? '',
      //     style: const TextStyle(
      //       color: Colors.black87,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   // backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '모임 설정',
          ),
        ],
      ),
    );
  }
}
