// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parish_group_member_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParishGroupMemberInfo _$ParishGroupMemberInfoFromJson(
        Map<String, dynamic> json) =>
    _ParishGroupMemberInfo(
      groupId: (json['group_id'] as num).toInt(),
      userId: json['user_id'] as String,
      roleId: (json['role_id'] as num).toInt(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      user: TamimUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParishGroupMemberInfoToJson(
        _ParishGroupMemberInfo instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'role_id': instance.roleId,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user': instance.user,
    };
