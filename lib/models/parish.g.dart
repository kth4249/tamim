// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Parish _$ParishFromJson(Map<String, dynamic> json) => _Parish(
      id: (json['id'] as num).toInt(),
      dioceseId: (json['diocese_id'] as num).toInt(),
      parishName: json['parish_name'] as String,
      registerKey: json['register_key'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ParishToJson(_Parish instance) => <String, dynamic>{
      'id': instance.id,
      'diocese_id': instance.dioceseId,
      'parish_name': instance.parishName,
      'register_key': instance.registerKey,
      'created_at': instance.createdAt.toIso8601String(),
    };
