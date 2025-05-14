// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolunteerEvent _$VolunteerEventFromJson(Map<String, dynamic> json) =>
    _VolunteerEvent(
      id: (json['id'] as num).toInt(),
      volunteerDate: DateTime.parse(json['volunteer_date'] as String),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : TamimUser.fromJson(json['user'] as Map<String, dynamic>),
      anon: json['anon'] == null
          ? null
          : VolunteerScheduleAnon.fromJson(
              json['anon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VolunteerEventToJson(_VolunteerEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'volunteer_date': instance.volunteerDate.toIso8601String(),
      'position': instance.position,
      'user': instance.user,
      'anon': instance.anon,
    };
