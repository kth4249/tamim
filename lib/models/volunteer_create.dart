import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer_create.freezed.dart';
part 'volunteer_create.g.dart';

// @freezed
// abstract class AvailableMemberByPositions with _$AvailableMemberByPositions {
//   const factory AvailableMemberByPositions({
//     required int id,
//     required String positionsName,
//     required List<UserInfo> availableMembers,
//   }) = _AvailableMemberByPositions;

//   factory AvailableMemberByPositions.fromJson(Map<String, dynamic> json) =>
//       _$AvailableMemberByPositionsFromJson(json);
// }

// @freezed
// abstract class AvailableMemberByDates with _$AvailableMemberByDates {
//   const factory AvailableMemberByDates({
//     required DateTime availableDate,
//     required List<UserInfo> availableMembers,
//   }) = _AvailableMemberByDates;

//   factory AvailableMemberByDates.fromJson(Map<String, dynamic> json) =>
//       _$AvailableMemberByDatesFromJson(json);
// }

@freezed
abstract class VolunteerCreateVO with _$VolunteerCreateVO {
  const factory VolunteerCreateVO({
    required int? id, // volunteerScheduleId
    required String? userId,
    required String name,
    required String nickname,
  }) = _VolunteerCreateVO;

  factory VolunteerCreateVO.fromJson(Map<String, dynamic> json) =>
      _$VolunteerCreateVOFromJson(json);
}
