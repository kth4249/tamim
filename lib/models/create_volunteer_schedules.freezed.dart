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
mixin _$CreateVolunteerSchedule {
  int get id;
  int get positionName;
  UserInfo get userInfo;

  /// Create a copy of CreateVolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateVolunteerScheduleCopyWith<CreateVolunteerSchedule> get copyWith =>
      _$CreateVolunteerScheduleCopyWithImpl<CreateVolunteerSchedule>(
          this as CreateVolunteerSchedule, _$identity);

  /// Serializes this CreateVolunteerSchedule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateVolunteerSchedule &&
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
    return 'CreateVolunteerSchedule(id: $id, positionName: $positionName, userInfo: $userInfo)';
  }
}

/// @nodoc
abstract mixin class $CreateVolunteerScheduleCopyWith<$Res> {
  factory $CreateVolunteerScheduleCopyWith(CreateVolunteerSchedule value,
          $Res Function(CreateVolunteerSchedule) _then) =
      _$CreateVolunteerScheduleCopyWithImpl;
  @useResult
  $Res call({int id, int positionName, UserInfo userInfo});

  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$CreateVolunteerScheduleCopyWithImpl<$Res>
    implements $CreateVolunteerScheduleCopyWith<$Res> {
  _$CreateVolunteerScheduleCopyWithImpl(this._self, this._then);

  final CreateVolunteerSchedule _self;
  final $Res Function(CreateVolunteerSchedule) _then;

  /// Create a copy of CreateVolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? positionName = null,
    Object? userInfo = null,
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
      userInfo: null == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }

  /// Create a copy of CreateVolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_self.userInfo, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _CreateVolunteerSchedule implements CreateVolunteerSchedule {
  const _CreateVolunteerSchedule(
      {required this.id, required this.positionName, required this.userInfo});
  factory _CreateVolunteerSchedule.fromJson(Map<String, dynamic> json) =>
      _$CreateVolunteerScheduleFromJson(json);

  @override
  final int id;
  @override
  final int positionName;
  @override
  final UserInfo userInfo;

  /// Create a copy of CreateVolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateVolunteerScheduleCopyWith<_CreateVolunteerSchedule> get copyWith =>
      __$CreateVolunteerScheduleCopyWithImpl<_CreateVolunteerSchedule>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateVolunteerScheduleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateVolunteerSchedule &&
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
    return 'CreateVolunteerSchedule(id: $id, positionName: $positionName, userInfo: $userInfo)';
  }
}

/// @nodoc
abstract mixin class _$CreateVolunteerScheduleCopyWith<$Res>
    implements $CreateVolunteerScheduleCopyWith<$Res> {
  factory _$CreateVolunteerScheduleCopyWith(_CreateVolunteerSchedule value,
          $Res Function(_CreateVolunteerSchedule) _then) =
      __$CreateVolunteerScheduleCopyWithImpl;
  @override
  @useResult
  $Res call({int id, int positionName, UserInfo userInfo});

  @override
  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$CreateVolunteerScheduleCopyWithImpl<$Res>
    implements _$CreateVolunteerScheduleCopyWith<$Res> {
  __$CreateVolunteerScheduleCopyWithImpl(this._self, this._then);

  final _CreateVolunteerSchedule _self;
  final $Res Function(_CreateVolunteerSchedule) _then;

  /// Create a copy of CreateVolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? positionName = null,
    Object? userInfo = null,
  }) {
    return _then(_CreateVolunteerSchedule(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      positionName: null == positionName
          ? _self.positionName
          : positionName // ignore: cast_nullable_to_non_nullable
              as int,
      userInfo: null == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
    ));
  }

  /// Create a copy of CreateVolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_self.userInfo, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

// dart format on
