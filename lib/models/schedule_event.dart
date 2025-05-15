import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/parish_group.dart';
import 'package:tamim/models/tamim_user.dart';

part 'schedule_event.freezed.dart';
part 'schedule_event.g.dart';

@freezed
abstract class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent({
    required int id,
    required DateTime scheduleDatetime,
    required ParishGroup parishGroup,
    required TamimUser tamimUser,
    required String scheduleName,
    required String scheduleDesc,
    required String openChatUrl,
    required int recruiteCount,
    required String shareScope,
  }) = _ScheduleEvent;

  factory ScheduleEvent.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEventFromJson(json);
}
