// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liturgical_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiturgicalEvent _$LiturgicalEventFromJson(Map<String, dynamic> json) =>
    _LiturgicalEvent(
      summary: json['summary'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$LiturgicalEventToJson(_LiturgicalEvent instance) =>
    <String, dynamic>{
      'summary': instance.summary,
      'description': instance.description,
    };
