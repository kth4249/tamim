// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      baptismalName: json['baptismal_name'] as String?,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      agreePushAt: json['agree_push_at'] == null
          ? null
          : DateTime.parse(json['agree_push_at'] as String),
    );

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'baptismal_name': instance.baptismalName,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'agree_push_at': instance.agreePushAt?.toIso8601String(),
    };
