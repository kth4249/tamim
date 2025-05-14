// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parish_group_member_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParishGroupMemberInfo {
  int get groupId;
  String get userId;
  int get roleId;
  String get status;
  DateTime get createdAt;
  DateTime get updatedAt;
  TamimUser get user;

  /// Create a copy of ParishGroupMemberInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParishGroupMemberInfoCopyWith<ParishGroupMemberInfo> get copyWith =>
      _$ParishGroupMemberInfoCopyWithImpl<ParishGroupMemberInfo>(
          this as ParishGroupMemberInfo, _$identity);

  /// Serializes this ParishGroupMemberInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParishGroupMemberInfo &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, groupId, userId, roleId, status, createdAt, updatedAt, user);

  @override
  String toString() {
    return 'ParishGroupMemberInfo(groupId: $groupId, userId: $userId, roleId: $roleId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class $ParishGroupMemberInfoCopyWith<$Res> {
  factory $ParishGroupMemberInfoCopyWith(ParishGroupMemberInfo value,
          $Res Function(ParishGroupMemberInfo) _then) =
      _$ParishGroupMemberInfoCopyWithImpl;
  @useResult
  $Res call(
      {int groupId,
      String userId,
      int roleId,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      TamimUser user});

  $TamimUserCopyWith<$Res> get user;
}

/// @nodoc
class _$ParishGroupMemberInfoCopyWithImpl<$Res>
    implements $ParishGroupMemberInfoCopyWith<$Res> {
  _$ParishGroupMemberInfoCopyWithImpl(this._self, this._then);

  final ParishGroupMemberInfo _self;
  final $Res Function(ParishGroupMemberInfo) _then;

  /// Create a copy of ParishGroupMemberInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? userId = null,
    Object? roleId = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
  }) {
    return _then(_self.copyWith(
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as TamimUser,
    ));
  }

  /// Create a copy of ParishGroupMemberInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TamimUserCopyWith<$Res> get user {
    return $TamimUserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ParishGroupMemberInfo implements ParishGroupMemberInfo {
  const _ParishGroupMemberInfo(
      {required this.groupId,
      required this.userId,
      required this.roleId,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.user});
  factory _ParishGroupMemberInfo.fromJson(Map<String, dynamic> json) =>
      _$ParishGroupMemberInfoFromJson(json);

  @override
  final int groupId;
  @override
  final String userId;
  @override
  final int roleId;
  @override
  final String status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final TamimUser user;

  /// Create a copy of ParishGroupMemberInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ParishGroupMemberInfoCopyWith<_ParishGroupMemberInfo> get copyWith =>
      __$ParishGroupMemberInfoCopyWithImpl<_ParishGroupMemberInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ParishGroupMemberInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParishGroupMemberInfo &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, groupId, userId, roleId, status, createdAt, updatedAt, user);

  @override
  String toString() {
    return 'ParishGroupMemberInfo(groupId: $groupId, userId: $userId, roleId: $roleId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$ParishGroupMemberInfoCopyWith<$Res>
    implements $ParishGroupMemberInfoCopyWith<$Res> {
  factory _$ParishGroupMemberInfoCopyWith(_ParishGroupMemberInfo value,
          $Res Function(_ParishGroupMemberInfo) _then) =
      __$ParishGroupMemberInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int groupId,
      String userId,
      int roleId,
      String status,
      DateTime createdAt,
      DateTime updatedAt,
      TamimUser user});

  @override
  $TamimUserCopyWith<$Res> get user;
}

/// @nodoc
class __$ParishGroupMemberInfoCopyWithImpl<$Res>
    implements _$ParishGroupMemberInfoCopyWith<$Res> {
  __$ParishGroupMemberInfoCopyWithImpl(this._self, this._then);

  final _ParishGroupMemberInfo _self;
  final $Res Function(_ParishGroupMemberInfo) _then;

  /// Create a copy of ParishGroupMemberInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? groupId = null,
    Object? userId = null,
    Object? roleId = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
  }) {
    return _then(_ParishGroupMemberInfo(
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      roleId: null == roleId
          ? _self.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as TamimUser,
    ));
  }

  /// Create a copy of ParishGroupMemberInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TamimUserCopyWith<$Res> get user {
    return $TamimUserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
