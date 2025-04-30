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
abstract class VolunteerCreateVO with _$VolunteerCreateVO {
  const factory VolunteerCreateVO({
    required int id,
    required int positionName,
    required VolunteerCreateUserVO? userInfo,
  }) = _VolunteerCreateVO;

  factory VolunteerCreateVO.fromJson(Map<String, dynamic> json) =>
      _$VolunteerCreateVOFromJson(json);
}

@freezed
abstract class VolunteerCreateUserVO with _$VolunteerCreateUserVO {
  const factory VolunteerCreateUserVO({
    required int id,
    required String name,
  }) = _VolunteerCreateUserVO;

  factory VolunteerCreateUserVO.fromJson(Map<String, dynamic> json) =>
      _$VolunteerCreateUserVOFromJson(json);
}
