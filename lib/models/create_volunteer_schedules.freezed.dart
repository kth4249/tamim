// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_volunteer_schedules.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvailableMemberByPositions {
  int get id;
  String get positionsName;
  List<UserInfo> get availableMembers;

  /// Create a copy of AvailableMemberByPositions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AvailableMemberByPositionsCopyWith<AvailableMemberByPositions>
      get copyWith =>
          _$AvailableMemberByPositionsCopyWithImpl<AvailableMemberByPositions>(
              this as AvailableMemberByPositions, _$identity);

  /// Serializes this AvailableMemberByPositions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvailableMemberByPositions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.positionsName, positionsName) ||
                other.positionsName == positionsName) &&
            const DeepCollectionEquality()
                .equals(other.availableMembers, availableMembers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, positionsName,
      const DeepCollectionEquality().hash(availableMembers));

  @override
  String toString() {
    return 'AvailableMemberByPositions(id: $id, positionsName: $positionsName, availableMembers: $availableMembers)';
  }
}

/// @nodoc
abstract mixin class $AvailableMemberByPositionsCopyWith<$Res> {
  factory $AvailableMemberByPositionsCopyWith(AvailableMemberByPositions value,
          $Res Function(AvailableMemberByPositions) _then) =
      _$AvailableMemberByPositionsCopyWithImpl;
  @useResult
  $Res call({int id, String positionsName, List<UserInfo> availableMembers});
}

/// @nodoc
class _$AvailableMemberByPositionsCopyWithImpl<$Res>
    implements $AvailableMemberByPositionsCopyWith<$Res> {
  _$AvailableMemberByPositionsCopyWithImpl(this._self, this._then);

  final AvailableMemberByPositions _self;
  final $Res Function(AvailableMemberByPositions) _then;

  /// Create a copy of AvailableMemberByPositions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? positionsName = null,
    Object? availableMembers = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      positionsName: null == positionsName
          ? _self.positionsName
          : positionsName // ignore: cast_nullable_to_non_nullable
              as String,
      availableMembers: null == availableMembers
          ? _self.availableMembers
          : availableMembers // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AvailableMemberByPositions implements AvailableMemberByPositions {
  const _AvailableMemberByPositions(
      {required this.id,
      required this.positionsName,
      required final List<UserInfo> availableMembers})
      : _availableMembers = availableMembers;
  factory _AvailableMemberByPositions.fromJson(Map<String, dynamic> json) =>
      _$AvailableMemberByPositionsFromJson(json);

  @override
  final int id;
  @override
  final String positionsName;
  final List<UserInfo> _availableMembers;
  @override
  List<UserInfo> get availableMembers {
    if (_availableMembers is EqualUnmodifiableListView)
      return _availableMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableMembers);
  }

  /// Create a copy of AvailableMemberByPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AvailableMemberByPositionsCopyWith<_AvailableMemberByPositions>
      get copyWith => __$AvailableMemberByPositionsCopyWithImpl<
          _AvailableMemberByPositions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AvailableMemberByPositionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvailableMemberByPositions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.positionsName, positionsName) ||
                other.positionsName == positionsName) &&
            const DeepCollectionEquality()
                .equals(other._availableMembers, _availableMembers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, positionsName,
      const DeepCollectionEquality().hash(_availableMembers));

  @override
  String toString() {
    return 'AvailableMemberByPositions(id: $id, positionsName: $positionsName, availableMembers: $availableMembers)';
  }
}

/// @nodoc
abstract mixin class _$AvailableMemberByPositionsCopyWith<$Res>
    implements $AvailableMemberByPositionsCopyWith<$Res> {
  factory _$AvailableMemberByPositionsCopyWith(
          _AvailableMemberByPositions value,
          $Res Function(_AvailableMemberByPositions) _then) =
      __$AvailableMemberByPositionsCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String positionsName, List<UserInfo> availableMembers});
}

/// @nodoc
class __$AvailableMemberByPositionsCopyWithImpl<$Res>
    implements _$AvailableMemberByPositionsCopyWith<$Res> {
  __$AvailableMemberByPositionsCopyWithImpl(this._self, this._then);

  final _AvailableMemberByPositions _self;
  final $Res Function(_AvailableMemberByPositions) _then;

  /// Create a copy of AvailableMemberByPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? positionsName = null,
    Object? availableMembers = null,
  }) {
    return _then(_AvailableMemberByPositions(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      positionsName: null == positionsName
          ? _self.positionsName
          : positionsName // ignore: cast_nullable_to_non_nullable
              as String,
      availableMembers: null == availableMembers
          ? _self._availableMembers
          : availableMembers // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>,
    ));
  }
}

/// @nodoc
mixin _$AvailableMemberByDates {
  DateTime get availableDate;
  List<UserInfo> get availableMembers;

  /// Create a copy of AvailableMemberByDates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AvailableMemberByDatesCopyWith<AvailableMemberByDates> get copyWith =>
      _$AvailableMemberByDatesCopyWithImpl<AvailableMemberByDates>(
          this as AvailableMemberByDates, _$identity);

  /// Serializes this AvailableMemberByDates to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AvailableMemberByDates &&
            (identical(other.availableDate, availableDate) ||
                other.availableDate == availableDate) &&
            const DeepCollectionEquality()
                .equals(other.availableMembers, availableMembers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, availableDate,
      const DeepCollectionEquality().hash(availableMembers));

  @override
  String toString() {
    return 'AvailableMemberByDates(availableDate: $availableDate, availableMembers: $availableMembers)';
  }
}

/// @nodoc
abstract mixin class $AvailableMemberByDatesCopyWith<$Res> {
  factory $AvailableMemberByDatesCopyWith(AvailableMemberByDates value,
          $Res Function(AvailableMemberByDates) _then) =
      _$AvailableMemberByDatesCopyWithImpl;
  @useResult
  $Res call({DateTime availableDate, List<UserInfo> availableMembers});
}

/// @nodoc
class _$AvailableMemberByDatesCopyWithImpl<$Res>
    implements $AvailableMemberByDatesCopyWith<$Res> {
  _$AvailableMemberByDatesCopyWithImpl(this._self, this._then);

  final AvailableMemberByDates _self;
  final $Res Function(AvailableMemberByDates) _then;

  /// Create a copy of AvailableMemberByDates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableDate = null,
    Object? availableMembers = null,
  }) {
    return _then(_self.copyWith(
      availableDate: null == availableDate
          ? _self.availableDate
          : availableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      availableMembers: null == availableMembers
          ? _self.availableMembers
          : availableMembers // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AvailableMemberByDates implements AvailableMemberByDates {
  const _AvailableMemberByDates(
      {required this.availableDate,
      required final List<UserInfo> availableMembers})
      : _availableMembers = availableMembers;
  factory _AvailableMemberByDates.fromJson(Map<String, dynamic> json) =>
      _$AvailableMemberByDatesFromJson(json);

  @override
  final DateTime availableDate;
  final List<UserInfo> _availableMembers;
  @override
  List<UserInfo> get availableMembers {
    if (_availableMembers is EqualUnmodifiableListView)
      return _availableMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableMembers);
  }

  /// Create a copy of AvailableMemberByDates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AvailableMemberByDatesCopyWith<_AvailableMemberByDates> get copyWith =>
      __$AvailableMemberByDatesCopyWithImpl<_AvailableMemberByDates>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AvailableMemberByDatesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AvailableMemberByDates &&
            (identical(other.availableDate, availableDate) ||
                other.availableDate == availableDate) &&
            const DeepCollectionEquality()
                .equals(other._availableMembers, _availableMembers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, availableDate,
      const DeepCollectionEquality().hash(_availableMembers));

  @override
  String toString() {
    return 'AvailableMemberByDates(availableDate: $availableDate, availableMembers: $availableMembers)';
  }
}

/// @nodoc
abstract mixin class _$AvailableMemberByDatesCopyWith<$Res>
    implements $AvailableMemberByDatesCopyWith<$Res> {
  factory _$AvailableMemberByDatesCopyWith(_AvailableMemberByDates value,
          $Res Function(_AvailableMemberByDates) _then) =
      __$AvailableMemberByDatesCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime availableDate, List<UserInfo> availableMembers});
}

/// @nodoc
class __$AvailableMemberByDatesCopyWithImpl<$Res>
    implements _$AvailableMemberByDatesCopyWith<$Res> {
  __$AvailableMemberByDatesCopyWithImpl(this._self, this._then);

  final _AvailableMemberByDates _self;
  final $Res Function(_AvailableMemberByDates) _then;

  /// Create a copy of AvailableMemberByDates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? availableDate = null,
    Object? availableMembers = null,
  }) {
    return _then(_AvailableMemberByDates(
      availableDate: null == availableDate
          ? _self.availableDate
          : availableDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      availableMembers: null == availableMembers
          ? _self._availableMembers
          : availableMembers // ignore: cast_nullable_to_non_nullable
              as List<UserInfo>,
    ));
  }
}

/// @nodoc
mixin _$VolunteerCreateVO {
  int get id;
  int get positionName;
  VolunteerCreateUserVO? get userInfo;

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
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, positionName, userInfo);

  @override
  String toString() {
    return 'VolunteerCreateVO(id: $id, positionName: $positionName, userInfo: $userInfo)';
  }
}

/// @nodoc
abstract mixin class $VolunteerCreateVOCopyWith<$Res> {
  factory $VolunteerCreateVOCopyWith(
          VolunteerCreateVO value, $Res Function(VolunteerCreateVO) _then) =
      _$VolunteerCreateVOCopyWithImpl;
  @useResult
  $Res call({int id, int positionName, VolunteerCreateUserVO? userInfo});

  $VolunteerCreateUserVOCopyWith<$Res>? get userInfo;
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
    Object? id = null,
    Object? positionName = null,
    Object? userInfo = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      positionName: null == positionName
          ? _self.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as int,
      userInfo: freezed == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as VolunteerCreateUserVO?,
    ));
  }

  /// Create a copy of VolunteerCreateVO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VolunteerCreateUserVOCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
      return null;
    }

    return $VolunteerCreateUserVOCopyWith<$Res>(_self.userInfo!, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _VolunteerCreateVO implements VolunteerCreateVO {
  const _VolunteerCreateVO(
      {required this.id, required this.positionName, required this.userInfo});
  factory _VolunteerCreateVO.fromJson(Map<String, dynamic> json) =>
      _$VolunteerCreateVOFromJson(json);

  @override
  final int id;
  @override
  final int positionName;
  @override
  final VolunteerCreateUserVO? userInfo;

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
            (identical(other.positionName, positionName) ||
                other.positionName == positionName) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, positionName, userInfo);

  @override
  String toString() {
    return 'VolunteerCreateVO(id: $id, positionName: $positionName, userInfo: $userInfo)';
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
  $Res call({int id, int positionName, VolunteerCreateUserVO? userInfo});

  @override
  $VolunteerCreateUserVOCopyWith<$Res>? get userInfo;
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
    Object? id = null,
    Object? positionName = null,
    Object? userInfo = freezed,
  }) {
    return _then(_VolunteerCreateVO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      positionName: null == positionName
          ? _self.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as int,
      userInfo: freezed == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as VolunteerCreateUserVO?,
    ));
  }

  /// Create a copy of VolunteerCreateVO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VolunteerCreateUserVOCopyWith<$Res>? get userInfo {
    if (_self.userInfo == null) {
      return null;
    }

    return $VolunteerCreateUserVOCopyWith<$Res>(_self.userInfo!, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

/// @nodoc
mixin _$VolunteerCreateUserVO {
  int get id;
  String get name;

  /// Create a copy of VolunteerCreateUserVO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolunteerCreateUserVOCopyWith<VolunteerCreateUserVO> get copyWith =>
      _$VolunteerCreateUserVOCopyWithImpl<VolunteerCreateUserVO>(
          this as VolunteerCreateUserVO, _$identity);

  /// Serializes this VolunteerCreateUserVO to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolunteerCreateUserVO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'VolunteerCreateUserVO(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $VolunteerCreateUserVOCopyWith<$Res> {
  factory $VolunteerCreateUserVOCopyWith(VolunteerCreateUserVO value,
          $Res Function(VolunteerCreateUserVO) _then) =
      _$VolunteerCreateUserVOCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$VolunteerCreateUserVOCopyWithImpl<$Res>
    implements $VolunteerCreateUserVOCopyWith<$Res> {
  _$VolunteerCreateUserVOCopyWithImpl(this._self, this._then);

  final VolunteerCreateUserVO _self;
  final $Res Function(VolunteerCreateUserVO) _then;

  /// Create a copy of VolunteerCreateUserVO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VolunteerCreateUserVO implements VolunteerCreateUserVO {
  const _VolunteerCreateUserVO({required this.id, required this.name});
  factory _VolunteerCreateUserVO.fromJson(Map<String, dynamic> json) =>
      _$VolunteerCreateUserVOFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of VolunteerCreateUserVO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolunteerCreateUserVOCopyWith<_VolunteerCreateUserVO> get copyWith =>
      __$VolunteerCreateUserVOCopyWithImpl<_VolunteerCreateUserVO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolunteerCreateUserVOToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolunteerCreateUserVO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'VolunteerCreateUserVO(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$VolunteerCreateUserVOCopyWith<$Res>
    implements $VolunteerCreateUserVOCopyWith<$Res> {
  factory _$VolunteerCreateUserVOCopyWith(_VolunteerCreateUserVO value,
          $Res Function(_VolunteerCreateUserVO) _then) =
      __$VolunteerCreateUserVOCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$VolunteerCreateUserVOCopyWithImpl<$Res>
    implements _$VolunteerCreateUserVOCopyWith<$Res> {
  __$VolunteerCreateUserVOCopyWithImpl(this._self, this._then);

  final _VolunteerCreateUserVO _self;
  final $Res Function(_VolunteerCreateUserVO) _then;

  /// Create a copy of VolunteerCreateUserVO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_VolunteerCreateUserVO(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
