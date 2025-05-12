import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/parish.dart';
import 'package:tamim/models/parish_group_member.dart';

part 'parish_group_info.freezed.dart';
part 'parish_group_info.g.dart';

@freezed
abstract class ParishGroupInfo with _$ParishGroupInfo {
  const factory ParishGroupInfo({
    required int id,
    required Parish parish,
    required int categoryId,
    required String groupName,
    required String description,
    required List<ParishGroupMember> members,
  }) = _ParishGroupInfo;

  factory ParishGroupInfo.fromJson(Map<String, dynamic> json) =>
      _$ParishGroupInfoFromJson(json);
}
