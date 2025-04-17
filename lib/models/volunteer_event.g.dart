// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolunteerEvent _$VolunteerEventFromJson(Map<String, dynamic> json) =>
    _VolunteerEvent(
      id: json['id'] as String,
      positionId: json['position_id'] as String,
      positionName: json['position_name'] as String,
      userId: json['user_id'] as String,
      name: json['name'] as String,
      baptismalName: json['baptismal_name'] as String,
    );

Map<String, dynamic> _$VolunteerEventToJson(_VolunteerEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position_id': instance.positionId,
      'position_name': instance.positionName,
      'user_id': instance.userId,
      'name': instance.name,
      'baptismal_name': instance.baptismalName,
    };
