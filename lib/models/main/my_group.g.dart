// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyGroup _$MyGroupFromJson(Map<String, dynamic> json) => _MyGroup(
      id: (json['id'] as num).toInt(),
      groupName: json['group_name'] as String,
      parish: Parish.fromJson(json['parish'] as Map<String, dynamic>),
      category: ParishGroupCategory.fromJson(
          json['category'] as Map<String, dynamic>),
      myInfo: (json['my_info'] as List<dynamic>)
          .map((e) => ParishGroupMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyGroupToJson(_MyGroup instance) => <String, dynamic>{
      'id': instance.id,
      'group_name': instance.groupName,
      'parish': instance.parish,
      'category': instance.category,
      'my_info': instance.myInfo,
    };
