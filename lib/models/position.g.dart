// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Position _$PositionFromJson(Map<String, dynamic> json) => _Position(
      id: (json['id'] as num).toInt(),
      groupId: (json['group_id'] as num).toInt(),
      positionName: json['position_name'] as String,
      description: json['description'] as String?,
      createdBy: json['created_by'] as String,
      createdAt: json['created_at'] as String,
      updatedBy: json['updated_by'] as String,
      updatedAt: json['updated_at'] as String,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PositionToJson(_Position instance) => <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'position_name': instance.positionName,
      'description': instance.description,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt,
      'updated_by': instance.updatedBy,
      'updated_at': instance.updatedAt,
      'order': instance.order,
    };
