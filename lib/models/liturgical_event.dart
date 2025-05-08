import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icalendar_parser/icalendar_parser.dart';

part 'liturgical_event.freezed.dart';
part 'liturgical_event.g.dart';

@freezed
abstract class LiturgicalEvent with _$LiturgicalEvent {
  const factory LiturgicalEvent({
    required String summary,
    required String? description,
  }) = _LiturgicalEvent;

  factory LiturgicalEvent.fromJson(Map<String, dynamic> json) =>
      _$LiturgicalEventFromJson(json);
}
