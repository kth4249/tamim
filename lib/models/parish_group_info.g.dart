// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parish_group_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParishGroupInfo _$ParishGroupInfoFromJson(Map<String, dynamic> json) =>
    _ParishGroupInfo(
      id: (json['id'] as num).toInt(),
      parish: Parish.fromJson(json['parish'] as Map<String, dynamic>),
      categoryId: (json['category_id'] as num).toInt(),
      groupName: json['group_name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ParishGroupInfoToJson(_ParishGroupInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parish': instance.parish,
      'category_id': instance.categoryId,
      'group_name': instance.groupName,
      'description': instance.description,
    };
