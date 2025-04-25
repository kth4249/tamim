// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_dates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberDates _$MemberDatesFromJson(Map<String, dynamic> json) => _MemberDates(
      id: json['id'] as String,
      name: json['name'] as String,
      baptismalName: json['baptismal_name'] as String,
      memberDates: (json['member_dates'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$MemberDatesToJson(_MemberDates instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'baptismal_name': instance.baptismalName,
      'member_dates':
          instance.memberDates.map((e) => e.toIso8601String()).toList(),
    };
