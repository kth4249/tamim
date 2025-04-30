import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../theme/app_theme.dart';

class CommonCalendar extends StatelessWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final List<DateTime>? selectedDays;
  final Function(DateTime, DateTime) onDaySelected;
  final List<dynamic> Function(DateTime)? eventLoader;
  final bool isMultiSelect;

  const CommonCalendar({
    super.key,
    required this.firstDay,
    required this.lastDay,
    required this.focusedDay,
    this.selectedDay,
    this.selectedDays,
    required this.onDaySelected,
    this.eventLoader,
    this.isMultiSelect = false,
  }) : assert(
          (isMultiSelect && selectedDays != null) ||
              (!isMultiSelect && selectedDay != null),
          'isMultiSelect가 true면 selectedDays를, false면 selectedDay를 제공해야 합니다.',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TableCalendar(
        firstDay: firstDay,
        lastDay: lastDay,
        focusedDay: focusedDay,
        selectedDayPredicate: (day) => isMultiSelect
            ? selectedDays!.any((selectedDay) => isSameDay(selectedDay, day))
            : isSameDay(selectedDay, day),
        calendarFormat: CalendarFormat.month,
        eventLoader: eventLoader,
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
          markerDecoration: const BoxDecoration(
            color: AppTheme.primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        onDaySelected: onDaySelected,
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            if (day.weekday == DateTime.sunday) {
              final text = DateFormat.E().format(day);
              return Center(
                child: Text(text, style: const TextStyle(color: Colors.red)),
              );
            }
            return null;
          },
          markerBuilder: (context, day, events) {
            if (events.isNotEmpty) {
              // return ListView.builder(
              //   shrinkWrap: true,
              //   scrollDirection: Axis.horizontal,
              //   itemCount: events.length,
              //   itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Icon(
                  size: 20,
                  Icons.church_outlined,
                  color: Colors.green,
                ),
              );
              //   },
              // );
            }
            return null;
          },
        ),
      ),
    );
  }
}
