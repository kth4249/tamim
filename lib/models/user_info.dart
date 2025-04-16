import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String id,
    required String? name,
    required String? baptismalName,
    required String? nickName,
    required String? status,
    required String? email,
    required DateTime? createdAt,
    required DateTime? updatedAt,
    required DateTime? lastSignInAt,
    required DateTime? agreePushAt,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
