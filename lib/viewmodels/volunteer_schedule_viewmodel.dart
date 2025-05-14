import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tamim/models/user_info.dart';
import 'package:tamim/models/volunteer_event.dart';
import 'package:tamim/models/volunteer_create.dart';
import 'package:tamim/providers/parish_group_provider.dart';
import 'package:tamim/providers/volunteer_schedule_provider.dart';

class VolunteerScheduleViewModel extends ChangeNotifier {
  final DateTime _firstDay = DateTime.now().subtract(const Duration(days: 365));
  final DateTime _lastDay = DateTime.now().add(const Duration(days: 365));
  DateTime _focusedDay = DateTime.now();
  final List<DateTime> _selectedDays = [];
  final Map<DateTime, Map<int, VolunteerCreateVO?>> _assignments = {};
  bool _isScheduleCreated = false;
  final Map<String, int> _memberServiceCount = {};

  DateTime get firstDay => _firstDay;
  DateTime get lastDay => _lastDay;
  DateTime get focusedDay => _focusedDay;
  List<DateTime> get selectedDays => _selectedDays;
  Map<DateTime, Map<int, VolunteerCreateVO?>> get assignments => _assignments;
  bool get isScheduleCreated => _isScheduleCreated;

  void initialize(BuildContext context) {
    _initializeMemberServiceCount(context);
  }

  List<VolunteerEvent> getEventsForDay(BuildContext context, DateTime day) {
    return context.read<ParishGroupProvider>().groupByVolunteerEvents[day] ??
        [];
  }

  void _initializeMemberServiceCount(BuildContext context) {
    final availableMemberIds = context
        .read<VolunteerScheduleProvider>()
        .availableDateByMember
        .map((e) => e.id)
        .toList();
    for (final memberId in availableMemberIds) {
      _memberServiceCount[memberId] = 0;
    }
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (_isScheduleCreated) return;

    _focusedDay = focusedDay;
    if (_selectedDays.any((day) => isSameDay(day, selectedDay))) {
      _selectedDays.removeWhere((day) => isSameDay(day, selectedDay));
    } else {
      _selectedDays.add(selectedDay);
    }
    notifyListeners();
  }

  bool isMemberAvailableForDate(
      BuildContext context, String memberId, DateTime date) {
    final availableDates = context
        .read<VolunteerScheduleProvider>()
        .availableDateByMember
        .firstWhere((e) => e.id == memberId)
        .memberDates
        .toList();
    return availableDates.indexWhere((e) => isSameDay(e, date)) != -1;
  }

  bool isMemberAvailableForPosition(
      BuildContext context, String memberId, int positionId) {
    final availablePositions = context
        .read<VolunteerScheduleProvider>()
        .memberPositions
        .firstWhere((e) => e.id == memberId)
        .positions
        .map((e) => e.id)
        .toList();
    return availablePositions.contains(positionId);
  }

  VolunteerCreateVO? findBestMemberForPosition(BuildContext context,
      DateTime date, int positionId, List<UserInfo> availableMembers) {
    final sortedMembers = availableMembers
        .where((member) =>
            isMemberAvailableForDate(context, member.id, date) &&
            isMemberAvailableForPosition(context, member.id, positionId))
        .toList()
      ..sort((a, b) => (_memberServiceCount[a.id] ?? 0)
          .compareTo(_memberServiceCount[b.id] ?? 0));

    return sortedMembers.isNotEmpty
        ? VolunteerCreateVO(
            id: null,
            userId: sortedMembers.first.id,
            name: sortedMembers.first.name,
            nickname: sortedMembers.first.nickname,
          )
        : null;
  }

  Future<void> onCreateSchedule(BuildContext context) async {
    if (_selectedDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('하나 이상의 날짜를 선택해주세요')),
      );
      return;
    }

    _initializeMemberServiceCount(context);

    for (final date in _selectedDays) {
      final assignments = <int, VolunteerCreateVO?>{};
      final availableMembers = List<UserInfo>.from(context
          .read<ParishGroupProvider>()
          .parishGroupMemberInfos
          .where((e) => e.status == 'active')
          .map((member) => member.user));

      final existingEvents =
          context.read<ParishGroupProvider>().groupByVolunteerEvents[date] ??
              [];

      availableMembers.removeWhere((member) =>
          existingEvents.any((event) => event.user?.id == member.id));

      final positions = context.read<ParishGroupProvider>().positions;
      for (final position in positions) {
        final existPosition = existingEvents
            .firstWhereOrNull((event) => event.position.id == position.id);

        final existUser = VolunteerCreateVO(
          id: existPosition?.id,
          userId: existPosition?.user?.id,
          name: existPosition?.user?.name ?? existPosition?.anon?.name ?? '',
          nickname:
              existPosition?.user?.nickname ?? existPosition?.anon?.name ?? '',
        );

        final selectedMember = existPosition == null
            ? findBestMemberForPosition(
                context, date, position.id, availableMembers)
            : existUser;

        if (selectedMember != null) {
          assignments[position.id] = selectedMember;
          if (selectedMember.userId != null) {
            _memberServiceCount[selectedMember.userId!] =
                (_memberServiceCount[selectedMember.userId!] ?? 0) + 1;
            availableMembers
                .removeWhere((member) => member.id == selectedMember.userId);
          }
        }
      }

      _assignments[date] = assignments;
    }

    _isScheduleCreated = true;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('봉사 일정이 생성되었습니다')),
    );
  }

  Future<void> saveVolunteerSchedule(BuildContext context) async {
    try {
      final parishGroupId = context.read<ParishGroupProvider>().parishGroup!.id;
      await context.read<VolunteerScheduleProvider>().saveVolunteerSchedule(
            parishGroupId,
            _assignments,
          );
      await context
          .read<ParishGroupProvider>()
          .fetchGroupByVolunteerEvents(parishGroupId.toString());

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('봉사일정이 확정되었습니다')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('오류가 발생했습니다: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void updateAssignments(
      DateTime date, Map<int, VolunteerCreateVO?> updatedAssignments) {
    _assignments[date] = updatedAssignments;
    notifyListeners();
  }
}
