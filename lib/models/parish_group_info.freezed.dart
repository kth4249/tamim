// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parish_group_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParishGroupInfo {
  int get id;
  Parish get parish;
  int get categoryId;
  String get groupName;
  String get description;

  /// Create a copy of ParishGroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParishGroupInfoCopyWith<ParishGroupInfo> get copyWith =>
      _$ParishGroupInfoCopyWithImpl<ParishGroupInfo>(
          this as ParishGroupInfo, _$identity);

  /// Serializes this ParishGroupInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParishGroupInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parish, parish) || other.parish == parish) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, parish, categoryId, groupName, description);

  @override
  String toString() {
    return 'ParishGroupInfo(id: $id, parish: $parish, categoryId: $categoryId, groupName: $groupName, description: $description)';
  }
}

/// @nodoc
abstract mixin class $ParishGroupInfoCopyWith<$Res> {
  factory $ParishGroupInfoCopyWith(
          ParishGroupInfo value, $Res Function(ParishGroupInfo) _then) =
      _$ParishGroupInfoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      Parish parish,
      int categoryId,
      String groupName,
      String description});

  $ParishCopyWith<$Res> get parish;
}

/// @nodoc
class _$ParishGroupInfoCopyWithImpl<$Res>
    implements $ParishGroupInfoCopyWith<$Res> {
  _$ParishGroupInfoCopyWithImpl(this._self, this._then);

  final ParishGroupInfo _self;
  final $Res Function(ParishGroupInfo) _then;

  /// Create a copy of ParishGroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parish = null,
    Object? categoryId = null,
    Object? groupName = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parish: null == parish
          ? _self.parish
          : parish // ignore: cast_nullable_to_non_nullable
              as Parish,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ParishGroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishCopyWith<$Res> get parish {
    return $ParishCopyWith<$Res>(_self.parish, (value) {
      return _then(_self.copyWith(parish: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ParishGroupInfo implements ParishGroupInfo {
  const _ParishGroupInfo(
      {required this.id,
      required this.parish,
      required this.categoryId,
      required this.groupName,
      required this.description});
  factory _ParishGroupInfo.fromJson(Map<String, dynamic> json) =>
      _$ParishGroupInfoFromJson(json);

  @override
  final int id;
  @override
  final Parish parish;
  @override
  final int categoryId;
  @override
  final String groupName;
  @override
  final String description;

  /// Create a copy of ParishGroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ParishGroupInfoCopyWith<_ParishGroupInfo> get copyWith =>
      __$ParishGroupInfoCopyWithImpl<_ParishGroupInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ParishGroupInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParishGroupInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parish, parish) || other.parish == parish) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, parish, categoryId, groupName, description);

  @override
  String toString() {
    return 'ParishGroupInfo(id: $id, parish: $parish, categoryId: $categoryId, groupName: $groupName, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$ParishGroupInfoCopyWith<$Res>
    implements $ParishGroupInfoCopyWith<$Res> {
  factory _$ParishGroupInfoCopyWith(
          _ParishGroupInfo value, $Res Function(_ParishGroupInfo) _then) =
      __$ParishGroupInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      Parish parish,
      int categoryId,
      String groupName,
      String description});

  @override
  $ParishCopyWith<$Res> get parish;
}

/// @nodoc
class __$ParishGroupInfoCopyWithImpl<$Res>
    implements _$ParishGroupInfoCopyWith<$Res> {
  __$ParishGroupInfoCopyWithImpl(this._self, this._then);

  final _ParishGroupInfo _self;
  final $Res Function(_ParishGroupInfo) _then;

  /// Create a copy of ParishGroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? parish = null,
    Object? categoryId = null,
    Object? groupName = null,
    Object? description = null,
  }) {
    return _then(_ParishGroupInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parish: null == parish
          ? _self.parish
          : parish // ignore: cast_nullable_to_non_nullable
              as Parish,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ParishGroupInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishCopyWith<$Res> get parish {
    return $ParishCopyWith<$Res>(_self.parish, (value) {
      return _then(_self.copyWith(parish: value));
    });
  }
}

// dart format on
