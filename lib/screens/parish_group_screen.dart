import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/models/volunteer_event.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/screens/group_management_screen.dart';
import 'package:tamim/screens/volunteer_confirmation_screen.dart';
import 'package:tamim/screens/available_schedule_screen.dart';
import '../theme/app_theme.dart';

class ParishGroupScreen extends StatefulWidget {
  const ParishGroupScreen({super.key, required this.id});

  final String id;

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
    super.initState();
  }

  List<VolunteerEvent> _getEventsForDay(DateTime day) {
    return context.read<ParishGroupProvider>().groupByVolunteerEvents[day] ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    final selectedDay = context
        .read<ParishGroupProvider>()
        .groupByVolunteerEvents[_selectedDay];
    Widget currentScreen = SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: TableCalendar(
              firstDay: _firstDay,
              lastDay: _lastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: CalendarFormat.month,
              eventLoader: _getEventsForDay,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.black54,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.black54,
                ),
              ),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: true,
                weekendTextStyle: const TextStyle(color: Colors.red),
                holidayTextStyle: const TextStyle(color: Colors.red),
                selectedDecoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: AppTheme.primaryColor.withAlpha(51),
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  if (day.weekday == DateTime.sunday) {
                    final text = DateFormat.E().format(day);

                    return Center(
                      child:
                          Text(text, style: const TextStyle(color: Colors.red)),
                    );
                  }
                  return null;
                },
                markerBuilder: (context, day, events) {
                  if (events.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: const Icon(
                            size: 20,
                            Icons.church_outlined,
                            color: Colors.green,
                          ),
                        );
                      },
                    );
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (selectedDay != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '이 날 봉사자',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: selectedDay.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                            backgroundColor: AppTheme.primaryColor.withAlpha(
                              26,
                            ),
                            child: const Text(
                              '김',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            "${selectedDay[index].user.name}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            selectedDay[index].position.positionName,
                          ),
                          // trailing: Container(
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: 12,
                          //     vertical: 6,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     color: AppTheme.primaryColor.withAlpha(26),
                          //     borderRadius: BorderRadius.circular(20),
                          //   ),
                          //   child: Text(
                          //     '출석 완료',
                          //     style: TextStyle(
                          //       color: AppTheme.primaryColor,
                          //       fontSize: 12,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          // ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),
        ],
      ),
    );

    // 선택된 탭에 따라 화면 전환
    if (_selectedIndex == 1) {
      currentScreen = const AvailableScheduleScreen();
    }
    if (_selectedIndex == 2) {
      currentScreen = const VolunteerConfirmationScreen();
    }
    if (_selectedIndex == 3) {
      currentScreen = const GroupManagementScreen();
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          context.watch<ParishGroupProvider>().parishGroup?.groupName ?? '',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined, color: Colors.black87),
            onPressed: () {
              context.read<AuthProvider>().signOut();
              context.go('/login');
            },
          ),
        ],
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
            icon: Icon(Icons.calendar_today),
            label: '날짜 입력',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '일정 조정',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '관리'),
        ],
      ),
    );
  }
}
