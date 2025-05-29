// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todays_volunteer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodaysVolunteer _$TodaysVolunteerFromJson(Map<String, dynamic> json) =>
    _TodaysVolunteer(
      id: (json['id'] as num).toInt(),
      position: Position.fromJson(json['position'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : TamimUser.fromJson(json['user'] as Map<String, dynamic>),
      anon: json['anon'] == null
          ? null
          : VolunteerScheduleAnon.fromJson(
              json['anon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TodaysVolunteerToJson(_TodaysVolunteer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'user': instance.user,
      'anon': instance.anon,
    };
