// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Schedule _$ScheduleFromJson(Map<String, dynamic> json) => _Schedule(
      id: (json['id'] as num).toInt(),
      scheduleDatetime: DateTime.parse(json['schedule_datetime'] as String),
      groupId: (json['group_id'] as num).toInt(),
      userId: json['user_id'] as String,
      scheduleName: json['schedule_name'] as String,
      scheduleDesc: json['schedule_desc'] as String?,
      openChatUrl: json['open_chat_url'] as String?,
      recruiteCount: (json['recruite_count'] as num).toInt(),
      shareScope: json['share_scope'] as String,
    );

Map<String, dynamic> _$ScheduleToJson(_Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'schedule_datetime': instance.scheduleDatetime.toIso8601String(),
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'schedule_name': instance.scheduleName,
      'schedule_desc': instance.scheduleDesc,
      'open_chat_url': instance.openChatUrl,
      'recruite_count': instance.recruiteCount,
      'share_scope': instance.shareScope,
    };
