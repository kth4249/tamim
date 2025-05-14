import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/user_info.dart';

part 'tamim_user.freezed.dart';
part 'tamim_user.g.dart';

@freezed
abstract class TamimUser with _$TamimUser {
  const factory TamimUser({
    required String id,
    required String name,
    required String email,
    required UserInfo? userInfo,
  }) = _TamimUser;

  factory TamimUser.fromJson(Map<String, dynamic> json) =>
      _$TamimUserFromJson(json);
}
