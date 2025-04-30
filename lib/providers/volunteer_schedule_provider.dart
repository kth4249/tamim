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
    final response = await supabase.from('users').select('''
            id, name, baptismal_name,
            parish_group_members!inner(group_id), 
            member_dates(available_date)
            ''').eq("parish_group_members.group_id", parishGroupId);
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
            id, name, baptismal_name,
            parish_group_members!inner(group_id), 
            positions: member_positions(positions(*))
            ''').eq("parish_group_members.group_id", parishGroupId);

    final transformed = response.map((e) {
      final memberPositions =
          e['positions'].map((e) => e['positions']).toList();
      return {
        ...e,
        'positions': memberPositions,
      };
    });

    logger.d(transformed);

    memberPositions =
        transformed.map((e) => MemberPositions.fromJson(e)).toList();

    notifyListeners();
  }

  void selectMember(String memberId) {
    selectedMemberId = memberId;
    notifyListeners();
  }

  Future<void> changeDate(DateTime date) async {
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
          .eq('group_id', 4)
          .eq('user_id', id)
          .eq('available_date', date.toIso8601String());
    } else {
      selectedDays.add(date);
      await supabase.from('member_dates').insert({
        'group_id': 4,
        'user_id': id,
        'available_date': date.toIso8601String(),
      });
    }

    availableDateByMember[memberIndex] = MemberDates(
      id: availableDateByMember[memberIndex].id,
      name: availableDateByMember[memberIndex].name,
      baptismalName: availableDateByMember[memberIndex].baptismalName,
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
