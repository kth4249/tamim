// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tamim_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TamimUser _$TamimUserFromJson(Map<String, dynamic> json) => _TamimUser(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      userInfo: json['user_info'] == null
          ? null
          : UserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TamimUserToJson(_TamimUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'user_info': instance.userInfo,
    };
