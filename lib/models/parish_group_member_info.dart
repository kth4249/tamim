import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/tamim_user.dart';

part 'parish_group_member_info.freezed.dart';
part 'parish_group_member_info.g.dart';

@freezed
abstract class ParishGroupMemberInfo with _$ParishGroupMemberInfo {
  const factory ParishGroupMemberInfo({
    required int groupId,
    required String userId,
    required int roleId,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    required TamimUser user,
  }) = _ParishGroupMemberInfo;

  factory ParishGroupMemberInfo.fromJson(Map<String, dynamic> json) =>
      _$ParishGroupMemberInfoFromJson(json);
}
