// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
  id: json['id'] as String,
  name: json['name'] as String?,
  baptismalName: json['baptismal_name'] as String?,
  nickName: json['nick_name'] as String?,
  status: json['status'] as String?,
  email: json['email'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  updatedAt:
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
  lastSignInAt:
      json['last_sign_in_at'] == null
          ? null
          : DateTime.parse(json['last_sign_in_at'] as String),
  agreePushAt:
      json['agree_push_at'] == null
          ? null
          : DateTime.parse(json['agree_push_at'] as String),
);

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'baptismal_name': instance.baptismalName,
  'nick_name': instance.nickName,
  'status': instance.status,
  'email': instance.email,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'last_sign_in_at': instance.lastSignInAt?.toIso8601String(),
  'agree_push_at': instance.agreePushAt?.toIso8601String(),
};
