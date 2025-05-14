// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tamim_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TamimUser {
  String get id;
  String get name;
  String get email;
  UserInfo? get userInfo;

  /// Create a copy of TamimUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TamimUserCopyWith<TamimUser> get copyWith =>
      _$TamimUserCopyWithImpl<TamimUser>(this as TamimUser, _$identity);

  /// Serializes this TamimUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TamimUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, userInfo);

  @override
  String toString() {
    return 'TamimUser(id: $id, name: $name, email: $email, userInfo: $userInfo)';
  }
}

/// @nodoc
abstract mixin class $TamimUserCopyWith<$Res> {
  factory $TamimUserCopyWith(TamimUser value, $Res Function(TamimUser) _then) =
      _$TamimUserCopyWithImpl;
  @useResult
  $Res call({String id, String name, String email, UserInfo? userInfo});

  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class _$TamimUserCopyWithImpl<$Res> implements $TamimUserCopyWith<$Res> {
  _$TamimUserCopyWithImpl(this._self, this._then);

  final TamimUser _self;
  final $Res Function(TamimUser) _then;

  /// Create a copy of TamimUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? userInfo = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userInfo: freezed == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ));
  }

  /// Create a copy of TamimUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_self.userInfo!, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _TamimUser implements TamimUser {
  const _TamimUser(
      {required this.id,
      required this.name,
      required this.email,
      required this.userInfo});
  factory _TamimUser.fromJson(Map<String, dynamic> json) =>
      _$TamimUserFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final UserInfo? userInfo;

  /// Create a copy of TamimUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TamimUserCopyWith<_TamimUser> get copyWith =>
      __$TamimUserCopyWithImpl<_TamimUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TamimUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TamimUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, userInfo);

  @override
  String toString() {
    return 'TamimUser(id: $id, name: $name, email: $email, userInfo: $userInfo)';
  }
}

/// @nodoc
abstract mixin class _$TamimUserCopyWith<$Res>
    implements $TamimUserCopyWith<$Res> {
  factory _$TamimUserCopyWith(
          _TamimUser value, $Res Function(_TamimUser) _then) =
      __$TamimUserCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String email, UserInfo? userInfo});

  @override
  $UserInfoCopyWith<$Res>? get userInfo;
}

/// @nodoc
class __$TamimUserCopyWithImpl<$Res> implements _$TamimUserCopyWith<$Res> {
  __$TamimUserCopyWithImpl(this._self, this._then);

  final _TamimUser _self;
  final $Res Function(_TamimUser) _then;

  /// Create a copy of TamimUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? userInfo = freezed,
  }) {
    return _then(_TamimUser(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userInfo: freezed == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ));
  }

  /// Create a copy of TamimUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_self.userInfo!, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

// dart format on
