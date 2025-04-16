// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diocese.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Diocese _$DioceseFromJson(Map<String, dynamic> json) => _Diocese(
  id: (json['id'] as num).toInt(),
  dioceseName: json['diocese_name'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$DioceseToJson(_Diocese instance) => <String, dynamic>{
  'id': instance.id,
  'diocese_name': instance.dioceseName,
  'created_at': instance.createdAt.toIso8601String(),
};
