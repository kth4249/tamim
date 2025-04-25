import 'package:flutter/material.dart';
import 'package:tamim/main.dart';
import 'package:tamim/models/member_dates.dart';

class VolunteerScheduleProvider extends ChangeNotifier {
  List<MemberDates> availableDateByMember = [];
  String? selectedMemberId;

  Future<void> fetchAvailableDateByMember(parishGroupId) async {
    final response = await supabase.from('users').select('''
            id, name, baptismal_name,
            parish_group_members(group_id), 
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

  void selectMember(String memberId) {
    selectedMemberId = memberId;
    notifyListeners();
  }

  void changeDate(DateTime date) {
    // if (selectedMemberId == null) {
    //   return;
    // }
    // final selectedDays = selectedMemberId!.memberDates;
    // if (selectedDays.contains(date)) {
    //   selectedDays.remove(date);
    // } else {
    //   selectedDays.add(date);
    // }

    // selectedMemberId = MemberDates(
    //   id: selectedMemberId!.id,
    //   name: selectedMemberId!.name,
    //   baptismalName: selectedMemberId!.baptismalName,
    //   memberDates: selectedDays,
    // );
  }
}
