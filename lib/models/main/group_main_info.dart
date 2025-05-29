import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/main/todays_volunteer.dart';
import 'package:tamim/models/parish.dart';
import 'package:tamim/models/parish_group_category.dart';

part 'group_main_info.freezed.dart';
part 'group_main_info.g.dart';

@freezed
abstract class GroupMainInfo with _$GroupMainInfo {
  const factory GroupMainInfo({
    required int id,
    required String groupName,
    required String description,
    required ParishGroupCategory category,
    required Parish parish,
    required List<TodaysVolunteer> volunteers,
  }) = _GroupMainInfo;

  factory GroupMainInfo.fromJson(Map<String, dynamic> json) =>
      _$GroupMainInfoFromJson(json);
}
