import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/models/user_info.dart';

part 'member_positions.freezed.dart';
part 'member_positions.g.dart';

@freezed
abstract class MemberPositions with _$MemberPositions {
  const factory MemberPositions({
    required String id,
    required String name,
    required UserInfo userInfo,
    required List<Position> positions,
  }) = _MemberPositions;

  factory MemberPositions.fromJson(Map<String, dynamic> json) =>
      _$MemberPositionsFromJson(json);
}
