import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/models/liturgical_event.dart';

class CalendarProvider extends ChangeNotifier {
  Map<DateTime, List<LiturgicalEvent>> liturgicalEvents = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  CalendarProvider() {
    fetchIcsEvents();
  }

  Future<void> fetchIcsEvents() async {
    final url = Uri.parse('https://calendar.google.com/calendar/ical/'
        'a9khtvfmob6nvo7jcr6379ld40%40group.calendar.google.com/'
        'public/basic.ics');
    final res = await http.get(url);
    final ical = ICalendar.fromString(res.body);

    final Map<DateTime, List<LiturgicalEvent>> events = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    );

    for (var entry in ical.data) {
      final dtstartStr = entry['dtstart']?.dt;
      if (dtstartStr == null) {
        continue;
      }
      final dtStart = DateTime.parse(dtstartStr);
      final day = DateTime(dtStart.year, dtStart.month, dtStart.day);

      events.putIfAbsent(day, () => []).add(LiturgicalEvent.fromJson(entry));
    }

    liturgicalEvents = events;

    notifyListeners();
  }
}
