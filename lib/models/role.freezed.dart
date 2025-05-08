// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Role {
  int get id;
  String get roleName;
  String? get description;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoleCopyWith<Role> get copyWith =>
      _$RoleCopyWithImpl<Role>(this as Role, _$identity);

  /// Serializes this Role to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Role &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, roleName, description);

  @override
  String toString() {
    return 'Role(id: $id, roleName: $roleName, description: $description)';
  }
}

/// @nodoc
abstract mixin class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) _then) =
      _$RoleCopyWithImpl;
  @useResult
  $Res call({int id, String roleName, String? description});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res> implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._self, this._then);

  final Role _self;
  final $Res Function(Role) _then;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roleName = null,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roleName: null == roleName
          ? _self.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Role implements Role {
  const _Role({required this.id, required this.roleName, this.description});
  factory _Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  @override
  final int id;
  @override
  final String roleName;
  @override
  final String? description;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoleCopyWith<_Role> get copyWith =>
      __$RoleCopyWithImpl<_Role>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RoleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Role &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, roleName, description);

  @override
  String toString() {
    return 'Role(id: $id, roleName: $roleName, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$RoleCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$RoleCopyWith(_Role value, $Res Function(_Role) _then) =
      __$RoleCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String roleName, String? description});
}

/// @nodoc
class __$RoleCopyWithImpl<$Res> implements _$RoleCopyWith<$Res> {
  __$RoleCopyWithImpl(this._self, this._then);

  final _Role _self;
  final $Res Function(_Role) _then;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? roleName = null,
    Object? description = freezed,
  }) {
    return _then(_Role(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roleName: null == roleName
          ? _self.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
