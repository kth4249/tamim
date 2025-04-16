// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parish_group_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParishGroupMember _$ParishGroupMemberFromJson(Map<String, dynamic> json) =>
    _ParishGroupMember(
      id: (json['id'] as num).toInt(),
      groupId: (json['group_id'] as num).toInt(),
      userId: json['user_id'] as String,
      roleId: (json['role_id'] as num).toInt(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ParishGroupMemberToJson(_ParishGroupMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'role_id': instance.roleId,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
