import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/main.dart';
import 'package:tamim/providers/auth_provider.dart';
import 'package:tamim/screens/position_management_screen.dart';
import 'package:tamim/screens/volunteer_confirmation_screen.dart';
import 'package:tamim/screens/volunteer_schedule_screen.dart';
import '../theme/app_theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final DateTime _firstDay = DateTime.now().subtract(const Duration(days: 365));
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 365));
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _schedules = [
    {
      'name': '김민지',
      'role': '성가대 반주',
      'date': DateTime(2024, 3, 3),
      'time': '오전 11시',
      'status': '출석 완료',
    },
    {
      'name': '박서연',
      'role': '독서 봉사',
      'date': DateTime(2024, 3, 17),
      'time': '오전 11시',
    },
    {
      'name': '최준호',
      'role': '해설 봉사',
      'date': DateTime(2024, 3, 24),
      'time': '오전 11시',
    },
    {
      'name': '정다은',
      'role': '성가대',
      'date': DateTime(2024, 3, 31),
      'time': '오전 11시',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = Column(
      children: [
        Container(
          color: Colors.white,
          child: TableCalendar(
            firstDay: _firstDay,
            lastDay: _lastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: CalendarFormat.month,
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              leftChevronIcon: const Icon(
                Icons.chevron_left,
                color: Colors.black54,
              ),
              rightChevronIcon: const Icon(
                Icons.chevron_right,
                color: Colors.black54,
              ),
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: true,
              weekendTextStyle: const TextStyle(color: Colors.red),
              holidayTextStyle: const TextStyle(color: Colors.red),
              selectedDecoration: BoxDecoration(
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
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '오늘의 봉사',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
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
                    child: Text(
                      '김',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: const Text(
                    '김민지',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('성가대 반주'),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withAlpha(26),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '출석 완료',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '다음 봉사 일정',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              for (var schedule in _schedules.skip(1))
                if (schedule['date'].isAfter(DateTime.now()))
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
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
                        title: Text(
                          schedule['name'],
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(schedule['role']),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${schedule['date'].month}월 ${schedule['date'].day}일',
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              schedule['time'],
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ],
    );

    // 선택된 탭에 따라 화면 전환
    if (_selectedIndex == 1) {
      currentScreen = const VolunteerScheduleScreen();
    }
    if (_selectedIndex == 2) {
      currentScreen = const PositionManagementScreen();
    }
    if (_selectedIndex == 3) {
      currentScreen = const VolunteerConfirmationScreen();
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          '성요한 성당',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black87,
            ),
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
          BottomNavigationBarItem(icon: Icon(Icons.group), label: '포지션 관리'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '일정 조정',
          ),
        ],
      ),
    );
  }
}
