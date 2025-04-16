// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parish_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParishGroup _$ParishGroupFromJson(Map<String, dynamic> json) => _ParishGroup(
  id: (json['id'] as num).toInt(),
  parishId: (json['parishId'] as num).toInt(),
  categoryId: (json['categoryId'] as num).toInt(),
  groupName: json['groupName'] as String,
  description: json['description'] as String,
  joinKey: json['joinKey'] as String,
  status: json['status'] as String,
  createId: json['createId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updateId: json['updateId'] as String,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ParishGroupToJson(_ParishGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parishId': instance.parishId,
      'categoryId': instance.categoryId,
      'groupName': instance.groupName,
      'description': instance.description,
      'joinKey': instance.joinKey,
      'status': instance.status,
      'createId': instance.createId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updateId': instance.updateId,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
