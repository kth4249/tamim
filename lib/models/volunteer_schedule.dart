import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer_schedule.freezed.dart';
part 'volunteer_schedule.g.dart';

@freezed
abstract class VolunteerSchedule with _$VolunteerSchedule {
  const factory VolunteerSchedule({
    required int id,
    required int groupId,
    required DateTime volunteerDate,
    required int positionId,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _VolunteerSchedule;

  factory VolunteerSchedule.fromJson(Map<String, dynamic> json) =>
      _$VolunteerScheduleFromJson(json);
}

@freezed
abstract class VolunteerScheduleAnon with _$VolunteerScheduleAnon {
  const factory VolunteerScheduleAnon({
    required int id,
    required String name,
  }) = _VolunteerScheduleAnon;

  factory VolunteerScheduleAnon.fromJson(Map<String, dynamic> json) =>
      _$VolunteerScheduleAnonFromJson(json);
}
