// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolunteerCreateVO {
  int? get id; // volunteerScheduleId
  String? get userId;
  String get name;
  String get nickname;

  /// Create a copy of VolunteerCreateVO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolunteerCreateVOCopyWith<VolunteerCreateVO> get copyWith =>
      _$VolunteerCreateVOCopyWithImpl<VolunteerCreateVO>(
          this as VolunteerCreateVO, _$identity);

  /// Serializes this VolunteerCreateVO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolunteerCreateVO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, nickname);

  @override
  String toString() {
    return 'VolunteerCreateVO(id: $id, userId: $userId, name: $name, nickname: $nickname)';
  }
}

/// @nodoc
abstract mixin class $VolunteerCreateVOCopyWith<$Res> {
  factory $VolunteerCreateVOCopyWith(
          VolunteerCreateVO value, $Res Function(VolunteerCreateVO) _then) =
      _$VolunteerCreateVOCopyWithImpl;
  @useResult
  $Res call({int? id, String? userId, String name, String nickname});
}

/// @nodoc
class _$VolunteerCreateVOCopyWithImpl<$Res>
    implements $VolunteerCreateVOCopyWith<$Res> {
  _$VolunteerCreateVOCopyWithImpl(this._self, this._then);

  final VolunteerCreateVO _self;
  final $Res Function(VolunteerCreateVO) _then;

  /// Create a copy of VolunteerCreateVO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = null,
    Object? nickname = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VolunteerCreateVO implements VolunteerCreateVO {
  const _VolunteerCreateVO(
      {required this.id,
      required this.userId,
      required this.name,
      required this.nickname});
  factory _VolunteerCreateVO.fromJson(Map<String, dynamic> json) =>
      _$VolunteerCreateVOFromJson(json);

  @override
  final int? id;
// volunteerScheduleId
  @override
  final String? userId;
  @override
  final String name;
  @override
  final String nickname;

  /// Create a copy of VolunteerCreateVO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolunteerCreateVOCopyWith<_VolunteerCreateVO> get copyWith =>
      __$VolunteerCreateVOCopyWithImpl<_VolunteerCreateVO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolunteerCreateVOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolunteerCreateVO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, nickname);

  @override
  String toString() {
    return 'VolunteerCreateVO(id: $id, userId: $userId, name: $name, nickname: $nickname)';
  }
}

/// @nodoc
abstract mixin class _$VolunteerCreateVOCopyWith<$Res>
    implements $VolunteerCreateVOCopyWith<$Res> {
  factory _$VolunteerCreateVOCopyWith(
          _VolunteerCreateVO value, $Res Function(_VolunteerCreateVO) _then) =
      __$VolunteerCreateVOCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? userId, String name, String nickname});
}

/// @nodoc
class __$VolunteerCreateVOCopyWithImpl<$Res>
    implements _$VolunteerCreateVOCopyWith<$Res> {
  __$VolunteerCreateVOCopyWithImpl(this._self, this._then);

  final _VolunteerCreateVO _self;
  final $Res Function(_VolunteerCreateVO) _then;

  /// Create a copy of VolunteerCreateVO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = null,
    Object? nickname = null,
  }) {
    return _then(_VolunteerCreateVO(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
