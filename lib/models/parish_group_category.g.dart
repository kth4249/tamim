// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parish_group_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParishGroupCategory _$ParishGroupCategoryFromJson(Map<String, dynamic> json) =>
    _ParishGroupCategory(
      id: (json['id'] as num).toInt(),
      categoryName: json['category_name'] as String,
    );

Map<String, dynamic> _$ParishGroupCategoryToJson(
        _ParishGroupCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
    };
