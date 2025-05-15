import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/models/schedule.dart';
import 'package:tamim/models/schedule_event.dart';
import 'package:tamim/providers/calendar_provider.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/schedule_provider.dart';
import 'package:tamim/screens/group_management_screen.dart';
import 'package:tamim/widgets/common_calendar.dart';
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
    // 날짜 key는 DateTime(year, month, day)로 맞춰야 함
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

    if (liturgicalEvents != null) {
      slivers.add(
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('이 날의 전례',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      );
      slivers.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final event = liturgicalEvents[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
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
                ),
              );
            },
            childCount: liturgicalEvents.length,
          ),
        ),
      );
    }

    if (volunteers != null) {
      slivers.add(
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text('이 날 봉사자',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      );
      slivers.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final volunteer = volunteers[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
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
            childCount: volunteers.length,
          ),
        ),
      );
    }

    // ... 기존 slivers 코드 중간에 추가 ...
    final schedules = _getSchedulesForDay(_selectedDay!);

    slivers.add(
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('이 날의 일정',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () => _showCreateScheduleDialog(_selectedDay!),
                icon: const Icon(Icons.add),
                label: const Text('일정 생성'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (schedules.isEmpty) {
      slivers.add(
        const SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Text('일정이 없습니다.', style: TextStyle(color: Colors.grey)),
            ),
          ),
        ),
      );
    } else {
      slivers.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final schedule = schedules[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 2,
                child: ListTile(
                  title: Text(schedule.scheduleName,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text(schedule.scheduleDesc),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        _showEditScheduleDialog(schedule);
                      } else if (value == 'delete') {
                        _deleteSchedule(schedule);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'edit', child: Text('수정')),
                      const PopupMenuItem(value: 'delete', child: Text('삭제')),
                    ],
                  ),
                  onTap: () {
                    // 상세보기/수정 등
                    _showEditScheduleDialog(schedule);
                  },
                ),
              );
            },
            childCount: schedules.length,
          ),
        ),
      );
    }

    slivers.add(const SliverToBoxAdapter(child: SizedBox(height: 24)));

    Widget currentScreen = CustomScrollView(
      slivers: slivers,
    );

    if (_selectedIndex == 1) {
      currentScreen = const GroupManagementScreen();
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.watch<ParishGroupProvider>().parishGroup?.groupName ?? '',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
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
