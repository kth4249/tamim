import 'package:freezed_annotation/freezed_annotation.dart';

part 'parish_group.freezed.dart';
part 'parish_group.g.dart';

@freezed
abstract class ParishGroup with _$ParishGroup {
  const factory ParishGroup({
    required int id,
    required int parishId,
    required int categoryId,
    required String groupName,
    required String description,
    required String joinKey,
    required String status,
    required String createdBy,
    required DateTime createdAt,
    required String updatedBy,
    required DateTime updatedAt,
  }) = _ParishGroup;

  factory ParishGroup.fromJson(Map<String, dynamic> json) =>
      _$ParishGroupFromJson(json);
}
