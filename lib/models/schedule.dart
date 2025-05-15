import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
abstract class Schedule with _$Schedule {
  const factory Schedule({
    required int id,
    required DateTime scheduleDatetime,
    required int groupId,
    required String userId,
    required String scheduleName,
    required String? scheduleDesc,
    required String? openChatUrl,
    required int recruiteCount,
    required String shareScope,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

enum ScheduleShareScope {
  public,
  group,
}

extension ScheduleShareScopeExtension on ScheduleShareScope {
  String get name {
    return this == ScheduleShareScope.public ? '전체공개' : '모임내공개';
  }

  String get value {
    return this == ScheduleShareScope.public ? 'public' : 'group';
  }
}
