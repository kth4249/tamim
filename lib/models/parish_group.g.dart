// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parish_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParishGroup _$ParishGroupFromJson(Map<String, dynamic> json) => _ParishGroup(
  id: (json['id'] as num).toInt(),
  parishId: (json['parish_id'] as num).toInt(),
  categoryId: (json['category_id'] as num).toInt(),
  groupName: json['group_name'] as String,
  description: json['description'] as String,
  joinKey: json['join_key'] as String,
  status: json['status'] as String,
  createdBy: json['created_by'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedBy: json['updated_by'] as String,
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ParishGroupToJson(_ParishGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parish_id': instance.parishId,
      'category_id': instance.categoryId,
      'group_name': instance.groupName,
      'description': instance.description,
      'join_key': instance.joinKey,
      'status': instance.status,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_by': instance.updatedBy,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
