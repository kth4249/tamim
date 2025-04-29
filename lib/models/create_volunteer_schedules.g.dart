// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_volunteer_schedules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvailableMemberByPositions _$AvailableMemberByPositionsFromJson(
        Map<String, dynamic> json) =>
    _AvailableMemberByPositions(
      id: (json['id'] as num).toInt(),
      positionsName: json['positions_name'] as String,
      availableMembers: (json['available_members'] as List<dynamic>)
          .map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableMemberByPositionsToJson(
        _AvailableMemberByPositions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'positions_name': instance.positionsName,
      'available_members': instance.availableMembers,
    };

_AvailableMemberByDates _$AvailableMemberByDatesFromJson(
        Map<String, dynamic> json) =>
    _AvailableMemberByDates(
      availableDate: DateTime.parse(json['available_date'] as String),
      availableMembers: (json['available_members'] as List<dynamic>)
          .map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableMemberByDatesToJson(
        _AvailableMemberByDates instance) =>
    <String, dynamic>{
      'available_date': instance.availableDate.toIso8601String(),
      'available_members': instance.availableMembers,
    };

_CreateVolunteerSchedule _$CreateVolunteerScheduleFromJson(
        Map<String, dynamic> json) =>
    _CreateVolunteerSchedule(
      id: (json['id'] as num).toInt(),
      positionName: (json['position_name'] as num).toInt(),
      userInfo: UserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateVolunteerScheduleToJson(
        _CreateVolunteerSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position_name': instance.positionName,
      'user_info': instance.userInfo,
    };
