import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish.dart';
import 'package:tamim/models/parish_group.dart';
import 'package:tamim/models/parish_group_member_info.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/models/volunteer_event.dart';

class ParishGroupProvider extends ChangeNotifier {
  Parish? parish;
  ParishGroup? parishGroup;
  List<Position> positions = [];
  Map<DateTime, List<VolunteerEvent>> groupByVolunteerEvents = {};
  List<ParishGroupMemberInfo> parishGroupMemberInfos = [];
  ParishGroupMemberInfo? myInfo;

  void reset() {
    parish = null;
    parishGroup = null;
    positions = [];
    groupByVolunteerEvents = {};
    parishGroupMemberInfos = [];
    myInfo = null;
  }

  Future<void> fetchData(String parishGroupId) async {
    final response = await supabase
        .from('parish_groups')
        .select('''
        *, 
        positions!positions_group_id_fkey(*),
        volunteer_schedules(*),
        parish_group_members(*, user: users!inner(*))
        ''')
        .eq('id', parishGroupId)
        // .eq('parish_group_members.status', 'active') // <- 주석처리: 모든 상태 포함
        .eq('parish_group_members.user.status', 'active')
        .single();
    logger.d('response: $response');

    final parishResponse = await supabase
        .from('parishs')
        .select('*')
        .eq('id', response['parish_id'])
        .single();
    parish = Parish.fromJson(parishResponse);
    parishGroup = ParishGroup.fromJson(response);
    positions = (response['positions'] as List<dynamic>)
        .map((json) => Position.fromJson(json))
        .toList();
    parishGroupMemberInfos = (response['parish_group_members'] as List<dynamic>)
        // .where((json) => json['user']['status'] == 'active')
        .map((json) => ParishGroupMemberInfo.fromJson(json))
        .toList();

    logger.d('parishGroupMemberInfos: $parishGroupMemberInfos');
    myInfo = parishGroupMemberInfos.firstWhereOrNull(
        (info) => info.userId == supabase.auth.currentUser!.id);

    await fetchGroupByVolunteerEvents(parishGroupId);

    notifyListeners();
  }

  Future<void> fetchGroupByVolunteerEvents(String parishGroupId) async {
    final volunteerResponse = await supabase
        .from('volunteer_schedules')
        .select(
            '*,position: positions(*),user: users(*),anon: volunteer_schedules_anon(id, name)')
        .eq('group_id', parishGroupId)
        .eq('status', 'completed');
    final volunteerEvents =
        volunteerResponse.map((json) => VolunteerEvent.fromJson(json)).toList();
    groupByVolunteerEvents = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(groupBy(volunteerEvents, (event) => event.volunteerDate));
    logger.d('groupByVolunteerEvents: $groupByVolunteerEvents');

    notifyListeners();
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  Future<void> loadPositions() async {
    if (parishGroup == null) return;

    final response = await supabase
        .from('positions')
        .select('*')
        .eq('group_id', parishGroup!.id)
        .order('order', ascending: true);

    positions = (response as List<dynamic>)
        .map((json) => Position.fromJson(json))
        .toList();

    notifyListeners();
  }

  Future<void> leaveGroup() async {
    await supabase
        .from('parish_group_members')
        .update({'status': 'inactive'})
        .eq('user_id', myInfo!.user.id)
        .eq('group_id', parishGroup!.id);

    reset();
  }

  Future<void> acceptMember(int? groupId, String userId) async {
    if (groupId == null) return;
    await supabase
        .from('parish_group_members')
        .update({'status': 'active'})
        .eq('group_id', groupId)
        .eq('user_id', userId);
    await fetchData(groupId.toString());
    notifyListeners();
  }

  Future<void> rejectMember(int? groupId, String userId) async {
    if (groupId == null) return;
    await supabase
        .from('parish_group_members')
        .update({'status': 'inactive'})
        .eq('group_id', groupId)
        .eq('user_id', userId);
    await fetchData(groupId.toString());
    notifyListeners();
  }

  Future<void> updateGroup(ParishGroup group) async {
    await supabase
        .from('parish_groups')
        .update(group.toJson())
        .eq('id', group.id);
    await fetchData(group.id.toString());
  }
}
