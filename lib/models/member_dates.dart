import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/user_info.dart';

part 'member_dates.freezed.dart';
part 'member_dates.g.dart';

@freezed
abstract class MemberDates with _$MemberDates {
  const factory MemberDates({
    required String id,
    required String name,
    required UserInfo userInfo,
    required List<DateTime> memberDates,
  }) = _MemberDates;

  factory MemberDates.fromJson(Map<String, dynamic> json) =>
      _$MemberDatesFromJson(json);
}
