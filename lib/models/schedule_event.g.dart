// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleEvent _$ScheduleEventFromJson(Map<String, dynamic> json) =>
    _ScheduleEvent(
      id: (json['id'] as num).toInt(),
      scheduleDatetime: DateTime.parse(json['schedule_datetime'] as String),
      parishGroup:
          ParishGroup.fromJson(json['parish_group'] as Map<String, dynamic>),
      tamimUser: TamimUser.fromJson(json['tamim_user'] as Map<String, dynamic>),
      scheduleName: json['schedule_name'] as String,
      scheduleDesc: json['schedule_desc'] as String,
      openChatUrl: json['open_chat_url'] as String,
      recruiteCount: (json['recruite_count'] as num).toInt(),
      shareScope: json['share_scope'] as String,
    );

Map<String, dynamic> _$ScheduleEventToJson(_ScheduleEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedule_datetime': instance.scheduleDatetime.toIso8601String(),
      'parish_group': instance.parishGroup,
      'tamim_user': instance.tamimUser,
      'schedule_name': instance.scheduleName,
      'schedule_desc': instance.scheduleDesc,
      'open_chat_url': instance.openChatUrl,
      'recruite_count': instance.recruiteCount,
      'share_scope': instance.shareScope,
    };
