// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolunteerCreateVO _$VolunteerCreateVOFromJson(Map<String, dynamic> json) =>
    _VolunteerCreateVO(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$VolunteerCreateVOToJson(_VolunteerCreateVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
    };
