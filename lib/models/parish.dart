import 'package:freezed_annotation/freezed_annotation.dart';

part 'parish.freezed.dart';
part 'parish.g.dart';

@freezed
abstract class Parish with _$Parish {
  const factory Parish({
    required int id,
    required int dioceseId,
    required String parishName,
    required String registerKey,
    required DateTime createdAt,
  }) = _Parish;

  factory Parish.fromJson(Map<String, dynamic> json) => _$ParishFromJson(json);
}
