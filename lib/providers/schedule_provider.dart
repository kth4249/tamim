import 'dart:collection';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/schedule.dart';
import 'package:tamim/models/schedule_event.dart';

class ScheduleProvider with ChangeNotifier {
  final SupabaseClient _client = Supabase.instance.client;

  // 날짜별 일정 Map
  Map<DateTime, List<ScheduleEvent>> schedulesByDate = {};

  // parishGroupId별 전체 일정 캐싱
  List<ScheduleEvent> allSchedules = [];

  // groupId로 일정 불러오기
  Future<void> fetchSchedules(int groupId) async {
    final response = await _client
        .from('schedules')
        .select('''
          id,
          schedule_datetime,
          parish_group: parish_groups!inner(*),
          tamim_user: users!user_id(*),
          schedule_name,
          schedule_desc,
          open_chat_url,
          recruite_count,
          share_scope
          ''')
        .eq('group_id', groupId)
        .order('schedule_datetime', ascending: true);
    logger.d('fetchSchedules: $response');
    allSchedules =
        (response as List).map((e) => ScheduleEvent.fromJson(e)).toList();

    // 날짜별로 그룹핑
    schedulesByDate = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(groupBy(allSchedules, (event) => event.scheduleDatetime));

    notifyListeners();
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  // 일정 생성
  Future<void> createSchedule(Map<String, dynamic> event) async {
    final response =
        await _client.from('schedules').insert(event).select().single();
    await _client.from('schedule_users').insert({
      'schedule_id': response['id'],
      'user_id': event['user_id'],
    });
    debugger();
    await fetchSchedules(event['group_id']); // 새로고침
  }

  // 일정 수정
  Future<void> updateSchedule(Schedule event) async {
    final data = event.toJson();
    await _client.from('schedules').update(data).eq('id', event.id);
    await fetchSchedules(event.groupId);
  }

  // 일정 삭제
  Future<void> deleteSchedule(Schedule event) async {
    await _client.from('schedules').delete().eq('id', event.id);
    await fetchSchedules(event.groupId);
  }
}
