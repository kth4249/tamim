import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/parish.dart';
import 'package:tamim/models/parish_group_category.dart';
import 'package:tamim/models/parish_group_member.dart';

part 'my_group.freezed.dart';
part 'my_group.g.dart';

@freezed
abstract class MyGroup with _$MyGroup {
  const factory MyGroup({
    required int id,
    required String groupName,
    required Parish parish,
    required ParishGroupCategory category,
    required List<ParishGroupMember> myInfo,
  }) = _MyGroup;

  factory MyGroup.fromJson(Map<String, dynamic> json) =>
      _$MyGroupFromJson(json);
}
