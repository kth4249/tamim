import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tamim/models/position.dart';
import 'package:tamim/models/tamim_user.dart';
import 'package:tamim/models/volunteer_schedule.dart';

part 'todays_volunteer.freezed.dart';
part 'todays_volunteer.g.dart';

@freezed
abstract class TodaysVolunteer with _$TodaysVolunteer {
  const factory TodaysVolunteer(
      {required int id,
      required Position position,
      required TamimUser? user,
      required VolunteerScheduleAnon? anon}) = _TodaysVolunteer;

  factory TodaysVolunteer.fromJson(Map<String, dynamic> json) =>
      _$TodaysVolunteerFromJson(json);
}
