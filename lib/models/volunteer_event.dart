import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/models/tamim_user.dart';
import 'package:tamim/models/volunteer_schedule.dart';

part 'volunteer_event.freezed.dart';
part 'volunteer_event.g.dart';

@freezed
abstract class VolunteerEvent with _$VolunteerEvent {
  const factory VolunteerEvent({
    required int id,
    required DateTime volunteerDate,
    required Position position,
    required TamimUser? user,
    required VolunteerScheduleAnon? anon,
  }) = _VolunteerEvent;

  factory VolunteerEvent.fromJson(Map<String, dynamic> json) =>
      _$VolunteerEventFromJson(json);
}
