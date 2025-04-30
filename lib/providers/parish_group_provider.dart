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

  Future<void> fetchData(String parishGroupId) async {
    final response = await supabase
        .from('parish_groups')
        .select(
          '''
        *, 
        positions!positions_group_id_fkey(*),
        volunteer_schedules(*),
        parish_group_members(*, user: users!parish_group_members_user_id_fkey(*))
        ''',
        )
        .eq('id', parishGroupId)
        .eq('parish_group_members.status', 'active')
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
        .where((json) => json['user']['status'] == 'active')
        .map((json) => ParishGroupMemberInfo.fromJson(json))
        .toList();

    logger.d('parishGroupMemberInfos: $parishGroupMemberInfos');
    myInfo = parishGroupMemberInfos
        .firstWhere((info) => info.userId == supabase.auth.currentUser!.id);

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
        .eq('group_id', parishGroup!.id);

    positions = (response as List<dynamic>)
        .map((json) => Position.fromJson(json))
        .toList();

    notifyListeners();
  }
}
