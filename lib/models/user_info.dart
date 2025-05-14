import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String id,
    required String nickname,
    required String? baptismalName,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime? agreePushAt,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
