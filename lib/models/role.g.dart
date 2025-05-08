// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Role _$RoleFromJson(Map<String, dynamic> json) => _Role(
      id: (json['id'] as num).toInt(),
      roleName: json['role_name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$RoleToJson(_Role instance) => <String, dynamic>{
      'id': instance.id,
      'role_name': instance.roleName,
      'description': instance.description,
    };
