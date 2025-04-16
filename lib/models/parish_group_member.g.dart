// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parish_group_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParishGroupMember _$ParishGroupMemberFromJson(Map<String, dynamic> json) =>
    _ParishGroupMember(
      id: (json['id'] as num).toInt(),
      groupId: (json['groupId'] as num).toInt(),
      userId: json['userId'] as String,
      roleId: (json['roleId'] as num).toInt(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ParishGroupMemberToJson(_ParishGroupMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'userId': instance.userId,
      'roleId': instance.roleId,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
