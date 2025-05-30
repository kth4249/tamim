import 'package:flutter/material.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/parish.dart';
import 'package:tamim/models/parish_group_category.dart';
import 'package:tamim/models/parish_group_info.dart';

class MainProvider extends ChangeNotifier {
  List<ParishGroupCategory> categories = [];
  List<Parish> parishes = [];
  List<ParishGroupInfo> groups = [];
  List<ParishGroupInfo> myGroups = [];
  Map<int, String> memberStatusMap = {};

  Future<void> loadData(String userId) async {
    try {
      await fetchCategories();
      await fetchParishes();
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
      myGroups =
          groups.where((g) => memberStatusMap[g.id] == 'active').toList();

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

  Future<void> fetchParishes() async {
    final parishesResponse = await supabase.from('parishs').select('*');
    parishes = (parishesResponse as List<dynamic>)
        .map((json) => Parish.fromJson(json))
        .toList();
  }

  Future<void> fetchCategories() async {
    final categoriesResponse =
        await supabase.from('parish_group_categories').select('*');
    categories = (categoriesResponse as List<dynamic>)
        .map((json) => ParishGroupCategory.fromJson(json))
        .toList();
  }

  void setMemberStatus(int groupId, String status) {
    memberStatusMap[groupId] = status;
    notifyListeners();
  }
}
