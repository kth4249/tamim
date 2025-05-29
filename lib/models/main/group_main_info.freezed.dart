// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_main_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupMainInfo {
  int get id;
  String get groupName;
  String get description;
  ParishGroupCategory get category;
  Parish get parish;
  List<TodaysVolunteer> get volunteers;

  /// Create a copy of GroupMainInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GroupMainInfoCopyWith<GroupMainInfo> get copyWith =>
      _$GroupMainInfoCopyWithImpl<GroupMainInfo>(
          this as GroupMainInfo, _$identity);

  /// Serializes this GroupMainInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GroupMainInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.parish, parish) || other.parish == parish) &&
            const DeepCollectionEquality()
                .equals(other.volunteers, volunteers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupName, description,
      category, parish, const DeepCollectionEquality().hash(volunteers));

  @override
  String toString() {
    return 'GroupMainInfo(id: $id, groupName: $groupName, description: $description, category: $category, parish: $parish, volunteers: $volunteers)';
  }
}

/// @nodoc
abstract mixin class $GroupMainInfoCopyWith<$Res> {
  factory $GroupMainInfoCopyWith(
          GroupMainInfo value, $Res Function(GroupMainInfo) _then) =
      _$GroupMainInfoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String groupName,
      String description,
      ParishGroupCategory category,
      Parish parish,
      List<TodaysVolunteer> volunteers});

  $ParishGroupCategoryCopyWith<$Res> get category;
  $ParishCopyWith<$Res> get parish;
}

/// @nodoc
class _$GroupMainInfoCopyWithImpl<$Res>
    implements $GroupMainInfoCopyWith<$Res> {
  _$GroupMainInfoCopyWithImpl(this._self, this._then);

  final GroupMainInfo _self;
  final $Res Function(GroupMainInfo) _then;

  /// Create a copy of GroupMainInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? description = null,
    Object? category = null,
    Object? parish = null,
    Object? volunteers = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ParishGroupCategory,
      parish: null == parish
          ? _self.parish
          : parish // ignore: cast_nullable_to_non_nullable
              as Parish,
      volunteers: null == volunteers
          ? _self.volunteers
          : volunteers // ignore: cast_nullable_to_non_nullable
              as List<TodaysVolunteer>,
    ));
  }

  /// Create a copy of GroupMainInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishGroupCategoryCopyWith<$Res> get category {
    return $ParishGroupCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of GroupMainInfo
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
class _GroupMainInfo implements GroupMainInfo {
  const _GroupMainInfo(
      {required this.id,
      required this.groupName,
      required this.description,
      required this.category,
      required this.parish,
      required final List<TodaysVolunteer> volunteers})
      : _volunteers = volunteers;
  factory _GroupMainInfo.fromJson(Map<String, dynamic> json) =>
      _$GroupMainInfoFromJson(json);

  @override
  final int id;
  @override
  final String groupName;
  @override
  final String description;
  @override
  final ParishGroupCategory category;
  @override
  final Parish parish;
  final List<TodaysVolunteer> _volunteers;
  @override
  List<TodaysVolunteer> get volunteers {
    if (_volunteers is EqualUnmodifiableListView) return _volunteers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_volunteers);
  }

  /// Create a copy of GroupMainInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GroupMainInfoCopyWith<_GroupMainInfo> get copyWith =>
      __$GroupMainInfoCopyWithImpl<_GroupMainInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GroupMainInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GroupMainInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.parish, parish) || other.parish == parish) &&
            const DeepCollectionEquality()
                .equals(other._volunteers, _volunteers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupName, description,
      category, parish, const DeepCollectionEquality().hash(_volunteers));

  @override
  String toString() {
    return 'GroupMainInfo(id: $id, groupName: $groupName, description: $description, category: $category, parish: $parish, volunteers: $volunteers)';
  }
}

/// @nodoc
abstract mixin class _$GroupMainInfoCopyWith<$Res>
    implements $GroupMainInfoCopyWith<$Res> {
  factory _$GroupMainInfoCopyWith(
          _GroupMainInfo value, $Res Function(_GroupMainInfo) _then) =
      __$GroupMainInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String groupName,
      String description,
      ParishGroupCategory category,
      Parish parish,
      List<TodaysVolunteer> volunteers});

  @override
  $ParishGroupCategoryCopyWith<$Res> get category;
  @override
  $ParishCopyWith<$Res> get parish;
}

/// @nodoc
class __$GroupMainInfoCopyWithImpl<$Res>
    implements _$GroupMainInfoCopyWith<$Res> {
  __$GroupMainInfoCopyWithImpl(this._self, this._then);

  final _GroupMainInfo _self;
  final $Res Function(_GroupMainInfo) _then;

  /// Create a copy of GroupMainInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? description = null,
    Object? category = null,
    Object? parish = null,
    Object? volunteers = null,
  }) {
    return _then(_GroupMainInfo(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ParishGroupCategory,
      parish: null == parish
          ? _self.parish
          : parish // ignore: cast_nullable_to_non_nullable
              as Parish,
      volunteers: null == volunteers
          ? _self._volunteers
          : volunteers // ignore: cast_nullable_to_non_nullable
              as List<TodaysVolunteer>,
    ));
  }

  /// Create a copy of GroupMainInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishGroupCategoryCopyWith<$Res> get category {
    return $ParishGroupCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }

  /// Create a copy of GroupMainInfo
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
