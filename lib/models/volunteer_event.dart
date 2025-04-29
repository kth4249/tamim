import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/models/user_info.dart';

part 'volunteer_event.freezed.dart';
part 'volunteer_event.g.dart';

@freezed
abstract class VolunteerEvent with _$VolunteerEvent {
  const factory VolunteerEvent({
    required int id,
    required DateTime volunteerDate,
    required Position position,
    required UserInfo? user,
  }) = _VolunteerEvent;

  factory VolunteerEvent.fromJson(Map<String, dynamic> json) =>
      _$VolunteerEventFromJson(json);
}
