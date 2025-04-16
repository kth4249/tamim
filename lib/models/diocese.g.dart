// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diocese.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Diocese _$DioceseFromJson(Map<String, dynamic> json) => _Diocese(
  id: (json['id'] as num).toInt(),
  dioceseName: json['dioceseName'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$DioceseToJson(_Diocese instance) => <String, dynamic>{
  'id': instance.id,
  'dioceseName': instance.dioceseName,
  'createdAt': instance.createdAt.toIso8601String(),
};
