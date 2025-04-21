// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parish_group_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParishGroupCategory {
  int get id;
  String get categoryName;

  /// Create a copy of ParishGroupCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ParishGroupCategoryCopyWith<ParishGroupCategory> get copyWith =>
      _$ParishGroupCategoryCopyWithImpl<ParishGroupCategory>(
          this as ParishGroupCategory, _$identity);

  /// Serializes this ParishGroupCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ParishGroupCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryName);

  @override
  String toString() {
    return 'ParishGroupCategory(id: $id, categoryName: $categoryName)';
  }
}

/// @nodoc
abstract mixin class $ParishGroupCategoryCopyWith<$Res> {
  factory $ParishGroupCategoryCopyWith(
          ParishGroupCategory value, $Res Function(ParishGroupCategory) _then) =
      _$ParishGroupCategoryCopyWithImpl;
  @useResult
  $Res call({int id, String categoryName});
}

/// @nodoc
class _$ParishGroupCategoryCopyWithImpl<$Res>
    implements $ParishGroupCategoryCopyWith<$Res> {
  _$ParishGroupCategoryCopyWithImpl(this._self, this._then);

  final ParishGroupCategory _self;
  final $Res Function(ParishGroupCategory) _then;

  /// Create a copy of ParishGroupCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryName = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ParishGroupCategory implements ParishGroupCategory {
  const _ParishGroupCategory({required this.id, required this.categoryName});
  factory _ParishGroupCategory.fromJson(Map<String, dynamic> json) =>
      _$ParishGroupCategoryFromJson(json);

  @override
  final int id;
  @override
  final String categoryName;

  /// Create a copy of ParishGroupCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ParishGroupCategoryCopyWith<_ParishGroupCategory> get copyWith =>
      __$ParishGroupCategoryCopyWithImpl<_ParishGroupCategory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ParishGroupCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ParishGroupCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryName);

  @override
  String toString() {
    return 'ParishGroupCategory(id: $id, categoryName: $categoryName)';
  }
}

/// @nodoc
abstract mixin class _$ParishGroupCategoryCopyWith<$Res>
    implements $ParishGroupCategoryCopyWith<$Res> {
  factory _$ParishGroupCategoryCopyWith(_ParishGroupCategory value,
          $Res Function(_ParishGroupCategory) _then) =
      __$ParishGroupCategoryCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String categoryName});
}

/// @nodoc
class __$ParishGroupCategoryCopyWithImpl<$Res>
    implements _$ParishGroupCategoryCopyWith<$Res> {
  __$ParishGroupCategoryCopyWithImpl(this._self, this._then);

  final _ParishGroupCategory _self;
  final $Res Function(_ParishGroupCategory) _then;

  /// Create a copy of ParishGroupCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? categoryName = null,
  }) {
    return _then(_ParishGroupCategory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
