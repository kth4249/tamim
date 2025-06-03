import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/models/schedule_event.dart';
import 'package:tamim/models/volunteer_event.dart';
import '../theme/app_theme.dart';

class CommonCalendar extends StatefulWidget {
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
  State<CommonCalendar> createState() => _CommonCalendarState();
}

class _CommonCalendarState extends State<CommonCalendar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TableCalendar(
        firstDay: widget.firstDay,
        lastDay: widget.lastDay,
        focusedDay: widget.focusedDay,
        selectedDayPredicate: (day) => widget.isMultiSelect
            ? widget.selectedDays!
                .any((selectedDay) => isSameDay(selectedDay, day))
            : isSameDay(widget.selectedDay, day),
        calendarFormat: CalendarFormat.month,
        eventLoader: widget.eventLoader,
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
          selectedTextStyle: const TextStyle(color: Colors.black),
          selectedDecoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.primaryColor,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          markerDecoration: const BoxDecoration(
            color: AppTheme.primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        onDaySelected: widget.onDaySelected,
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
            List<Widget> children = [];
            if (events.any((event) => event is VolunteerEvent)) {
              children.add(Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Icon(Icons.church, color: Colors.lightGreen),
              ));
            }

            if (events.any((event) => event is ScheduleEvent)) {
              children.add(Container(
                margin: const EdgeInsets.only(top: 30),
                child: const Icon(Icons.event_available,
                    color: Colors.lightBlueAccent),
              ));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            );
          },
        ),
      ),
    );
  }
}
