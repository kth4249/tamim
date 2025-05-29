// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_main_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupMainInfo _$GroupMainInfoFromJson(Map<String, dynamic> json) =>
    _GroupMainInfo(
      id: (json['id'] as num).toInt(),
      groupName: json['group_name'] as String,
      description: json['description'] as String,
      category: ParishGroupCategory.fromJson(
          json['category'] as Map<String, dynamic>),
      parish: Parish.fromJson(json['parish'] as Map<String, dynamic>),
      volunteers: (json['volunteers'] as List<dynamic>)
          .map((e) => TodaysVolunteer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupMainInfoToJson(_GroupMainInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_name': instance.groupName,
      'description': instance.description,
      'category': instance.category,
      'parish': instance.parish,
      'volunteers': instance.volunteers,
    };
