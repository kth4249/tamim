// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
  id: json['id'] as String,
  name: json['name'] as String?,
  baptismalName: json['baptismalName'] as String?,
  nickName: json['nickName'] as String?,
  status: json['status'] as String?,
  email: json['email'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  lastSignInAt:
      json['lastSignInAt'] == null
          ? null
          : DateTime.parse(json['lastSignInAt'] as String),
  agreePushAt:
      json['agreePushAt'] == null
          ? null
          : DateTime.parse(json['agreePushAt'] as String),
);

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'baptismalName': instance.baptismalName,
  'nickName': instance.nickName,
  'status': instance.status,
  'email': instance.email,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'lastSignInAt': instance.lastSignInAt?.toIso8601String(),
  'agreePushAt': instance.agreePushAt?.toIso8601String(),
};
