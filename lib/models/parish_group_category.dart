import 'package:freezed_annotation/freezed_annotation.dart';

part 'parish_group_category.freezed.dart';
part 'parish_group_category.g.dart';

@freezed
abstract class ParishGroupCategory with _$ParishGroupCategory {
  const factory ParishGroupCategory({
    required int id,
    required String categoryName,
  }) = _ParishGroupCategory;

  factory ParishGroupCategory.fromJson(Map<String, dynamic> json) =>
      _$ParishGroupCategoryFromJson(json);
}
