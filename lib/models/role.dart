import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.freezed.dart';
part 'role.g.dart';

enum GroupRole { leader, member }

const roleIdMap = {GroupRole.leader: 1, GroupRole.member: 2};

@freezed
abstract class Role with _$Role {
  const factory Role({
    required int id,
    required String roleName,
    String? description,
  }) = _Role;
  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}
