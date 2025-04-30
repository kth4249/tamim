// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolunteerSchedule _$VolunteerScheduleFromJson(Map<String, dynamic> json) =>
    _VolunteerSchedule(
      id: (json['id'] as num).toInt(),
      groupId: (json['group_id'] as num).toInt(),
      volunteerDate: DateTime.parse(json['volunteer_date'] as String),
      positionId: (json['position_id'] as num).toInt(),
      userId: json['user_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$VolunteerScheduleToJson(_VolunteerSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'volunteer_date': instance.volunteerDate.toIso8601String(),
      'position_id': instance.positionId,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_VolunteerScheduleAnon _$VolunteerScheduleAnonFromJson(
        Map<String, dynamic> json) =>
    _VolunteerScheduleAnon(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$VolunteerScheduleAnonToJson(
        _VolunteerScheduleAnon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
