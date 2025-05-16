// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_positions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberPositions _$MemberPositionsFromJson(Map<String, dynamic> json) =>
    _MemberPositions(
      id: json['id'] as String,
      name: json['name'] as String,
      userInfo: UserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
      positions: (json['positions'] as List<dynamic>)
          .map((e) => Position.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MemberPositionsToJson(_MemberPositions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_info': instance.userInfo,
      'positions': instance.positions,
    };
