import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/user_info.dart';

part 'create_volunteer_schedules.freezed.dart';
part 'create_volunteer_schedules.g.dart';

@freezed
abstract class AvailableMemberByPositions with _$AvailableMemberByPositions {
  const factory AvailableMemberByPositions({
    required int id,
    required String positionsName,
    required List<UserInfo> availableMembers,
  }) = _AvailableMemberByPositions;

  factory AvailableMemberByPositions.fromJson(Map<String, dynamic> json) =>
      _$AvailableMemberByPositionsFromJson(json);
}

@freezed
abstract class AvailableMemberByDates with _$AvailableMemberByDates {
  const factory AvailableMemberByDates({
    required DateTime availableDate,
    required List<UserInfo> availableMembers,
  }) = _AvailableMemberByDates;

  factory AvailableMemberByDates.fromJson(Map<String, dynamic> json) =>
      _$AvailableMemberByDatesFromJson(json);
}

@freezed
abstract class CreateVolunteerSchedule with _$CreateVolunteerSchedule {
  const factory CreateVolunteerSchedule({
    required int id,
    required int positionName,
    required UserInfo userInfo,
  }) = _CreateVolunteerSchedule;

  factory CreateVolunteerSchedule.fromJson(Map<String, dynamic> json) =>
      _$CreateVolunteerScheduleFromJson(json);
}
