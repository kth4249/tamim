import 'package:freezed_annotation/freezed_annotation.dart';

part 'diocese.freezed.dart';
part 'diocese.g.dart';

@freezed
abstract class Diocese with _$Diocese {
  const factory Diocese({
    required int id,
    required String dioceseName,
    required DateTime createdAt,
  }) = _Diocese;

  factory Diocese.fromJson(Map<String, dynamic> json) =>
      _$DioceseFromJson(json);
}
