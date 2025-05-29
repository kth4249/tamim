// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyGroup {
  int get id;
  String get groupName;
  Parish get parish;
  ParishGroupCategory get category;
  List<ParishGroupMember> get myInfo;

  /// Create a copy of MyGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyGroupCopyWith<MyGroup> get copyWith =>
      _$MyGroupCopyWithImpl<MyGroup>(this as MyGroup, _$identity);

  /// Serializes this MyGroup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.parish, parish) || other.parish == parish) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other.myInfo, myInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupName, parish, category,
      const DeepCollectionEquality().hash(myInfo));

  @override
  String toString() {
    return 'MyGroup(id: $id, groupName: $groupName, parish: $parish, category: $category, myInfo: $myInfo)';
  }
}

/// @nodoc
abstract mixin class $MyGroupCopyWith<$Res> {
  factory $MyGroupCopyWith(MyGroup value, $Res Function(MyGroup) _then) =
      _$MyGroupCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String groupName,
      Parish parish,
      ParishGroupCategory category,
      List<ParishGroupMember> myInfo});

  $ParishCopyWith<$Res> get parish;
  $ParishGroupCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$MyGroupCopyWithImpl<$Res> implements $MyGroupCopyWith<$Res> {
  _$MyGroupCopyWithImpl(this._self, this._then);

  final MyGroup _self;
  final $Res Function(MyGroup) _then;

  /// Create a copy of MyGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? parish = null,
    Object? category = null,
    Object? myInfo = null,
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
      parish: null == parish
          ? _self.parish
          : parish // ignore: cast_nullable_to_non_nullable
              as Parish,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ParishGroupCategory,
      myInfo: null == myInfo
          ? _self.myInfo
          : myInfo // ignore: cast_nullable_to_non_nullable
              as List<ParishGroupMember>,
    ));
  }

  /// Create a copy of MyGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishCopyWith<$Res> get parish {
    return $ParishCopyWith<$Res>(_self.parish, (value) {
      return _then(_self.copyWith(parish: value));
    });
  }

  /// Create a copy of MyGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishGroupCategoryCopyWith<$Res> get category {
    return $ParishGroupCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _MyGroup implements MyGroup {
  const _MyGroup(
      {required this.id,
      required this.groupName,
      required this.parish,
      required this.category,
      required final List<ParishGroupMember> myInfo})
      : _myInfo = myInfo;
  factory _MyGroup.fromJson(Map<String, dynamic> json) =>
      _$MyGroupFromJson(json);

  @override
  final int id;
  @override
  final String groupName;
  @override
  final Parish parish;
  @override
  final ParishGroupCategory category;
  final List<ParishGroupMember> _myInfo;
  @override
  List<ParishGroupMember> get myInfo {
    if (_myInfo is EqualUnmodifiableListView) return _myInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myInfo);
  }

  /// Create a copy of MyGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyGroupCopyWith<_MyGroup> get copyWith =>
      __$MyGroupCopyWithImpl<_MyGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MyGroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.parish, parish) || other.parish == parish) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._myInfo, _myInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupName, parish, category,
      const DeepCollectionEquality().hash(_myInfo));

  @override
  String toString() {
    return 'MyGroup(id: $id, groupName: $groupName, parish: $parish, category: $category, myInfo: $myInfo)';
  }
}

/// @nodoc
abstract mixin class _$MyGroupCopyWith<$Res> implements $MyGroupCopyWith<$Res> {
  factory _$MyGroupCopyWith(_MyGroup value, $Res Function(_MyGroup) _then) =
      __$MyGroupCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String groupName,
      Parish parish,
      ParishGroupCategory category,
      List<ParishGroupMember> myInfo});

  @override
  $ParishCopyWith<$Res> get parish;
  @override
  $ParishGroupCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$MyGroupCopyWithImpl<$Res> implements _$MyGroupCopyWith<$Res> {
  __$MyGroupCopyWithImpl(this._self, this._then);

  final _MyGroup _self;
  final $Res Function(_MyGroup) _then;

  /// Create a copy of MyGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? groupName = null,
    Object? parish = null,
    Object? category = null,
    Object? myInfo = null,
  }) {
    return _then(_MyGroup(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupName: null == groupName
          ? _self.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      parish: null == parish
          ? _self.parish
          : parish // ignore: cast_nullable_to_non_nullable
              as Parish,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ParishGroupCategory,
      myInfo: null == myInfo
          ? _self._myInfo
          : myInfo // ignore: cast_nullable_to_non_nullable
              as List<ParishGroupMember>,
    ));
  }

  /// Create a copy of MyGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishCopyWith<$Res> get parish {
    return $ParishCopyWith<$Res>(_self.parish, (value) {
      return _then(_self.copyWith(parish: value));
    });
  }

  /// Create a copy of MyGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishGroupCategoryCopyWith<$Res> get category {
    return $ParishGroupCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

// dart format on
