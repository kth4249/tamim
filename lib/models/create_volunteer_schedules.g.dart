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

_VolunteerCreateVO _$VolunteerCreateVOFromJson(Map<String, dynamic> json) =>
    _VolunteerCreateVO(
      id: (json['id'] as num).toInt(),
      positionName: (json['position_name'] as num).toInt(),
      userInfo: json['user_info'] == null
          ? null
          : VolunteerCreateUserVO.fromJson(
              json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VolunteerCreateVOToJson(_VolunteerCreateVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position_name': instance.positionName,
      'user_info': instance.userInfo,
    };

_VolunteerCreateUserVO _$VolunteerCreateUserVOFromJson(
        Map<String, dynamic> json) =>
    _VolunteerCreateUserVO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$VolunteerCreateUserVOToJson(
        _VolunteerCreateUserVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
