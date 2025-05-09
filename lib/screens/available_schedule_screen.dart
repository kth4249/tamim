import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 날짜 포맷팅을 위해 추가
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/volunteer_schedule_provider.dart';

class AvailableScheduleScreen extends StatefulWidget {
  const AvailableScheduleScreen({super.key});

  @override
  State<AvailableScheduleScreen> createState() =>
      _AvailableScheduleScreenState();
}

class _AvailableScheduleScreenState extends State<AvailableScheduleScreen> {
  final DateTime _firstDay = DateTime.now().subtract(const Duration(days: 365));
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 365));
  DateTime _focusedDay = DateTime.now();
  // DateTime _focusedDay = DateTime(2024, 3, 1); // 현재 달력이 보여주는 월

  @override
  Widget build(BuildContext context) {
    final availableDateByMember =
        context.watch<VolunteerScheduleProvider>().availableDateByMember;
    final selectedMemberId =
        context.watch<VolunteerScheduleProvider>().selectedMemberId;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '멤버 선택',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: availableDateByMember.map((member) {
                  final isSelected = member.id == selectedMemberId;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      selected: isSelected,
                      label: Text(
                        member.name,
                        style: TextStyle(
                          color: isSelected
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      selectedColor: Theme.of(context).colorScheme.primary,
                      onSelected: (selected) {
                        if (selected) {
                          context
                              .read<VolunteerScheduleProvider>()
                              .selectMember(member.id);
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            _buildCalendar(),
          ],
        ),
      ),
    );
  }

  // 달력 위젯 생성
  Widget _buildCalendar() {
    final availableDateByMember =
        context.watch<VolunteerScheduleProvider>().availableDateByMember;
    final selectedMemberId =
        context.watch<VolunteerScheduleProvider>().selectedMemberId;
    final selectedDays =
        (availableDateByMember.isNotEmpty && selectedMemberId != null)
            ? availableDateByMember
                .firstWhere((element) => element.id == selectedMemberId)
                .memberDates
            : [];
    final groupId = context.read<ParishGroupProvider>().parishGroup!.id;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TableCalendar<DateTime>(
        locale: 'ko_KR',
        firstDay: _firstDay,
        lastDay: _lastDay,
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return selectedDays.where((e) => isSameDay(e, day)).isNotEmpty;
        },
        onDaySelected: (selectedDay, focusedDay) async {
          await context
              .read<VolunteerScheduleProvider>()
              .changeDate(groupId, selectedDay);
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            if (day.weekday == DateTime.sunday ||
                day.weekday == DateTime.saturday) {
              final text = DateFormat.E('ko_KR').format(day);
              return Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }
            return null;
          },
          selectedBuilder: (context, day, focusedDay) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
          todayBuilder: (context, day, focusedDay) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
          defaultBuilder: (context, day, focusedDay) {
            if (day.weekday == DateTime.sunday ||
                day.weekday == DateTime.saturday) {
              return Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              );
            }
            return null;
          },
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          leftChevronVisible: true,
          rightChevronVisible: true,
          headerPadding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
          todayDecoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
          outsideDaysVisible: false,
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
          weekendStyle: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// main.dart 파일 등에서 이 스크린을 사용합니다.
// 예시:
// MaterialApp(
//   localizationsDelegates: [
//     GlobalMaterialLocalizations.delegate,
//     GlobalWidgetsLocalizations.delegate,
//     GlobalCupertinoLocalizations.delegate,
//   ],
//   supportedLocales: [
//     const Locale('ko', 'KR'),
//   ],
//   home: VolunteerScheduleScreen(),
// );
