import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/member_dates.dart';
import 'package:tamim/models/member_positions.dart';
import 'package:tamim/models/volunteer_create.dart';

class VolunteerScheduleProvider extends ChangeNotifier {
  List<MemberDates> availableDateByMember = [];
  String? selectedMemberId;
  List<MemberPositions> memberPositions = [];

  Future<void> fetchAvailableDateByMember(parishGroupId) async {
    final response = await supabase
        .from('users')
        .select('''
            id, name,
            parish_group_members!inner(group_id, status), 
            member_dates(available_date, group_id),
            user_info!inner(*)
            ''')
        .eq("parish_group_members.group_id", parishGroupId)
        .eq('member_dates.group_id', parishGroupId)
        .eq('parish_group_members.status', 'active')
        .eq('user_info.status', 'active');
    final transformed = response.map((e) {
      final memberDates =
          e['member_dates'].map((e) => e['available_date']).toList();
      return {
        ...e,
        'member_dates': memberDates,
      };
    });
    availableDateByMember =
        transformed.map((e) => MemberDates.fromJson(e)).toList();

    notifyListeners();
  }

  Future<void> fetchMemberPositions(parishGroupId) async {
    final response = await supabase.from('users').select('''
            id, name,
            user_info!inner(*),
            parish_group_members!inner(group_id),
            positions!member_positions(*)
            ''').eq("parish_group_members.group_id", parishGroupId);

    memberPositions = response.map((e) => MemberPositions.fromJson(e)).toList();

    notifyListeners();
  }

  void selectMember(String memberId) {
    selectedMemberId = memberId;
    notifyListeners();
  }

  Future<void> changeDate(int groupId, DateTime date) async {
    final id = selectedMemberId;
    if (id == null) {
      return;
    }
    final selectedDays = List<DateTime>.from(availableDateByMember
        .firstWhere((element) => element.id == id)
        .memberDates);
    final memberIndex =
        availableDateByMember.indexWhere((element) => element.id == id);
    final dateIndex = selectedDays.indexWhere((e) => isSameDay(e, date));
    if (dateIndex != -1) {
      selectedDays.removeAt(dateIndex);
      await supabase
          .from('member_dates')
          .delete()
          .eq('group_id', groupId)
          .eq('user_id', id)
          .eq('available_date', date.toIso8601String());
    } else {
      selectedDays.add(date);
      await supabase.from('member_dates').insert({
        'group_id': groupId,
        'user_id': id,
        'available_date': date.toIso8601String(),
      });
    }

    availableDateByMember[memberIndex] = MemberDates(
      id: availableDateByMember[memberIndex].id,
      name: availableDateByMember[memberIndex].name,
      userInfo: availableDateByMember[memberIndex].userInfo,
      memberDates: selectedDays,
    );

    notifyListeners();
  }

  Future<void> saveVolunteerSchedule(
    int groupId,
    Map<DateTime, Map<int, VolunteerCreateVO?>> assignments,
  ) async {
    // final List<Map<String, dynamic>> schedules = [];

    for (final entry in assignments.entries) {
      final date = entry.key;
      final positionAssignments = entry.value;

      for (final positionEntry in positionAssignments.entries) {
        final positionId = positionEntry.key;
        final volunteer = positionEntry.value;

        if (volunteer != null) {
          final id = volunteer.id;
          final userId = volunteer.userId;

          if (volunteer.name == '') {
            if (id != null) {
              await supabase.from('volunteer_schedules').delete().eq('id', id);
            }
            continue;
          }

          final addData = {
            'group_id': groupId,
            'volunteer_date': date.toIso8601String(),
            'position_id': positionId,
            'user_id': userId,
            'created_by': supabase.auth.currentUser!.id,
            'updated_by': supabase.auth.currentUser!.id,
            'status': 'completed',
          };

          if (id != null) {
            addData['id'] = id;
          }

          final response = await supabase
              .from('volunteer_schedules')
              .upsert(addData)
              .select()
              .single();

          if (userId == null) {
            await supabase.from('volunteer_schedules_anon').upsert({
              'id': response['id'],
              'name': volunteer.name,
            });
          }
        }
      }
    }

    // if (schedules.isNotEmpty) {
    //   final response = await supabase.from('volunteer_schedules').upsert(schedules).select();
    // }

    notifyListeners();
  }
}
