import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer_event.freezed.dart';
part 'volunteer_event.g.dart';

@freezed
abstract class VolunteerEvent with _$VolunteerEvent {
  const factory VolunteerEvent({
    required String id,
    required String positionId,
    required String positionName,
    required String userId,
    required String name,
    required String baptismalName,
  }) = _VolunteerEvent;

  factory VolunteerEvent.fromJson(Map<String, dynamic> json) =>
      _$VolunteerEventFromJson(json);
}
