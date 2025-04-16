import 'package:freezed_annotation/freezed_annotation.dart';

part 'parish_group_member.freezed.dart';
part 'parish_group_member.g.dart';

@freezed
abstract class ParishGroupMember with _$ParishGroupMember {
  const factory ParishGroupMember({
    required int id,
    required int groupId,
    required String userId,
    required int roleId,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ParishGroupMember;

  factory ParishGroupMember.fromJson(Map<String, dynamic> json) =>
      _$ParishGroupMemberFromJson(json);
}
