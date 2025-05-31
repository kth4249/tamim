import 'package:flutter/material.dart';
import 'package:tamim/api/parishs_api.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/main/group_main_info.dart';
import 'package:tamim/models/main/my_group.dart';
import 'package:tamim/models/parish.dart';
import 'package:tamim/models/parish_group_category.dart';
import 'package:tamim/models/parish_group_info.dart';

class MainProvider extends ChangeNotifier {
  List<ParishGroupCategory> categories = [];
  List<Parish> parishs = [];
  List<ParishGroupInfo> groups = [];
  List<MyGroup> myGroups = [];
  Map<int, String> memberStatusMap = {};
  GroupMainInfo? groupMainInfo;

  Future<void> loadData(String userId) async {
    try {
      await fetchCategories();
      await fetchParishs();
      await fetchGroups(userId);

      final myGroupsResponse = await supabase
          .from('parish_group_members')
          .select('group_id, status')
          .eq('user_id', userId);

      memberStatusMap = {
        for (var group in groups)
          group.id: myGroupsResponse.firstWhere(
            (json) => json['group_id'] == group.id,
            orElse: () => {'status': 'inactive'},
          )['status'] as String
      };
      // 내가 가입한 모임만 필터링
      // myGroups =
      //     groups.where((g) => memberStatusMap[g.id] == 'active').toList();

      notifyListeners();
    } catch (e) {
      logger.e('Error loading data: $e');
    }
  }

  Future<void> fetchGroups(String userId) async {
    final groupsResponse = await supabase
        .from('parish_groups')
        .select('*, parish:parishs(*), members:parish_group_members(*)')
        .eq('status', 'active')
        .eq('parish_group_members.user_id', userId);
    groups = (groupsResponse as List<dynamic>)
        .map((json) => ParishGroupInfo.fromJson(json))
        .toList();
  }

  Future<void> fetchMyGroups(String userId) async {
    final myGroupsResponse = await supabase.from('parish_groups').select('''
            id
            , group_name
            , parish:parishs(*)
            , category:parish_group_categories!inner(*)
            , my_info:parish_group_members!inner(*)
            ''').eq('status', 'active').eq('my_info.user_id', userId);
    logger.d(myGroupsResponse);

    myGroups = (myGroupsResponse as List<dynamic>)
        .map((json) => MyGroup.fromJson(json))
        .toList();

    notifyListeners();
  }

  Future<void> fetchParishs() async {
    final parishesResponse = await ParishsApi.getParishsEqParams();
    parishs = parishesResponse;

    notifyListeners();
  }

  Future<void> fetchCategories() async {
    final categoriesResponse =
        await supabase.from('parish_group_categories').select('*');
    categories = (categoriesResponse as List<dynamic>)
        .map((json) => ParishGroupCategory.fromJson(json))
        .toList();

    notifyListeners();
  }

  void setMemberStatus(int groupId, String status) {
    memberStatusMap[groupId] = status;
    notifyListeners();
  }

  Future<void> fetchGroupMainInfo(int groupId) async {
    final groupMainInfoResponse = await supabase
        .from('parish_groups')
        .select('''
            id
            , group_name
            , description
            , category:parish_group_categories!inner(*)
            , parish:parishs(*)
            , volunteers:volunteer_schedules(
                id,
                position:positions!inner(*),
                user:users!inner(*),
                anon:volunteer_schedules_anon(*)
            )
            ''')
        .eq('id', groupId)
        .eq('volunteers.volunteer_date',
            DateTime(2025, 5, 18).toIso8601String())
        .single();
    logger.d(groupMainInfoResponse);
    groupMainInfo = GroupMainInfo.fromJson(groupMainInfoResponse);

    notifyListeners();
  }
}
