import 'package:freezed_annotation/freezed_annotation.dart';

part 'position.freezed.dart';
part 'position.g.dart';

@freezed
abstract class Position with _$Position {
  const factory Position({
    required int id,
    required int groupId,
    required String positionName,
    required String? description,
    required String createdBy,
    required String createdAt,
    required String updatedBy,
    required String updatedAt,
    int? order,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}
