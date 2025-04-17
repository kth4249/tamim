import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish.dart';
import 'package:tamim/models/parish_group.dart';
import 'package:tamim/models/parish_group_member.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/models/user_info.dart';
import 'package:tamim/models/volunteer_event.dart';
import 'package:tamim/models/volunteer_schedule.dart';

class ParishGroupProvider extends ChangeNotifier {
  final supabase = Supabase.instance.client;

  Parish? parish;
  ParishGroup? parishGroup;
  List<Position> positions = [];
  List<VolunteerSchedule> volunteerSchedules = [];
  List<ParishGroupMember> parishGroupMembers = [];
  // List<UserInfo> groupMembers = [];
  Map<String, List<VolunteerEvent>>? volunteerEvents;

  Future<void> fetchDatas(String parishGroupId) async {
    final response =
        await supabase
            .from('parish_groups')
            .select(
              '*,positions(*),volunteer_schedules(*),parish_group_members(*)',
            )
            .eq('id', parishGroupId)
            .eq('parish_group_members.status', 'active')
            .single();
    logger.d('response: $response');

    final parishResponse =
        await supabase
            .from('parishs')
            .select('*')
            .eq('id', response['parish_id'])
            .single();
    parish = Parish.fromJson(parishResponse);

    parishGroup = ParishGroup.fromJson(response);
    positions =
        (response['positions'] as List<dynamic>)
            .map((json) => Position.fromJson(json))
            .toList();
    volunteerSchedules =
        (response['volunteer_schedules'] as List<dynamic>)
            .map((json) => VolunteerSchedule.fromJson(json))
            .toList();
    parishGroupMembers =
        (response['parish_group_members'] as List<dynamic>)
            .map((json) => ParishGroupMember.fromJson(json))
            .toList();
    // groupMembers =
    //     (response['parish_group_members'] as List<dynamic>)
    //         .map((json) => json['user_id'])
    //         .map((userId) async {
    //           final userInfo =
    //               await supabase
    //                   .from('users')
    //                   .select('*')
    //                   .containedBy('id', userId)
    //                   .single();
    //           return UserInfo.fromJson(userInfo);
    //         })
    //         .cast<UserInfo>()
    //         .toList();

    // final members = response['parish_group_members'] as List<dynamic>;
    // final userIds = members.map((json) => json['user_id']).toList();
    // final fetchUserInfo = await supabase
    //     .from('users')
    //     .select('*')
    //     .containedBy('id', userIds);
    // groupMembers =
    //     fetchUserInfo.map((json) => UserInfo.fromJson(json)).toList();
    notifyListeners();
  }
}
