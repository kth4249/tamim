// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolunteerSchedule {
  int get id;
  int get groupId;
  DateTime get volunteerDate;
  int get positionId;
  String get userId;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of VolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolunteerScheduleCopyWith<VolunteerSchedule> get copyWith =>
      _$VolunteerScheduleCopyWithImpl<VolunteerSchedule>(
          this as VolunteerSchedule, _$identity);

  /// Serializes this VolunteerSchedule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolunteerSchedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.volunteerDate, volunteerDate) ||
                other.volunteerDate == volunteerDate) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupId, volunteerDate,
      positionId, userId, createdAt, updatedAt);

  @override
  String toString() {
    return 'VolunteerSchedule(id: $id, groupId: $groupId, volunteerDate: $volunteerDate, positionId: $positionId, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $VolunteerScheduleCopyWith<$Res> {
  factory $VolunteerScheduleCopyWith(
          VolunteerSchedule value, $Res Function(VolunteerSchedule) _then) =
      _$VolunteerScheduleCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int groupId,
      DateTime volunteerDate,
      int positionId,
      String userId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$VolunteerScheduleCopyWithImpl<$Res>
    implements $VolunteerScheduleCopyWith<$Res> {
  _$VolunteerScheduleCopyWithImpl(this._self, this._then);

  final VolunteerSchedule _self;
  final $Res Function(VolunteerSchedule) _then;

  /// Create a copy of VolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? volunteerDate = null,
    Object? positionId = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      volunteerDate: null == volunteerDate
          ? _self.volunteerDate
          : volunteerDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      positionId: null == positionId
          ? _self.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VolunteerSchedule implements VolunteerSchedule {
  const _VolunteerSchedule(
      {required this.id,
      required this.groupId,
      required this.volunteerDate,
      required this.positionId,
      required this.userId,
      required this.createdAt,
      required this.updatedAt});
  factory _VolunteerSchedule.fromJson(Map<String, dynamic> json) =>
      _$VolunteerScheduleFromJson(json);

  @override
  final int id;
  @override
  final int groupId;
  @override
  final DateTime volunteerDate;
  @override
  final int positionId;
  @override
  final String userId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of VolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolunteerScheduleCopyWith<_VolunteerSchedule> get copyWith =>
      __$VolunteerScheduleCopyWithImpl<_VolunteerSchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolunteerScheduleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolunteerSchedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.volunteerDate, volunteerDate) ||
                other.volunteerDate == volunteerDate) &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, groupId, volunteerDate,
      positionId, userId, createdAt, updatedAt);

  @override
  String toString() {
    return 'VolunteerSchedule(id: $id, groupId: $groupId, volunteerDate: $volunteerDate, positionId: $positionId, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$VolunteerScheduleCopyWith<$Res>
    implements $VolunteerScheduleCopyWith<$Res> {
  factory _$VolunteerScheduleCopyWith(
          _VolunteerSchedule value, $Res Function(_VolunteerSchedule) _then) =
      __$VolunteerScheduleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int groupId,
      DateTime volunteerDate,
      int positionId,
      String userId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$VolunteerScheduleCopyWithImpl<$Res>
    implements _$VolunteerScheduleCopyWith<$Res> {
  __$VolunteerScheduleCopyWithImpl(this._self, this._then);

  final _VolunteerSchedule _self;
  final $Res Function(_VolunteerSchedule) _then;

  /// Create a copy of VolunteerSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? volunteerDate = null,
    Object? positionId = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_VolunteerSchedule(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      volunteerDate: null == volunteerDate
          ? _self.volunteerDate
          : volunteerDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      positionId: null == positionId
          ? _self.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$VolunteerScheduleAnon {
  int get id;
  String get name;

  /// Create a copy of VolunteerScheduleAnon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolunteerScheduleAnonCopyWith<VolunteerScheduleAnon> get copyWith =>
      _$VolunteerScheduleAnonCopyWithImpl<VolunteerScheduleAnon>(
          this as VolunteerScheduleAnon, _$identity);

  /// Serializes this VolunteerScheduleAnon to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolunteerScheduleAnon &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'VolunteerScheduleAnon(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $VolunteerScheduleAnonCopyWith<$Res> {
  factory $VolunteerScheduleAnonCopyWith(VolunteerScheduleAnon value,
          $Res Function(VolunteerScheduleAnon) _then) =
      _$VolunteerScheduleAnonCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$VolunteerScheduleAnonCopyWithImpl<$Res>
    implements $VolunteerScheduleAnonCopyWith<$Res> {
  _$VolunteerScheduleAnonCopyWithImpl(this._self, this._then);

  final VolunteerScheduleAnon _self;
  final $Res Function(VolunteerScheduleAnon) _then;

  /// Create a copy of VolunteerScheduleAnon
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
class _VolunteerScheduleAnon implements VolunteerScheduleAnon {
  const _VolunteerScheduleAnon({required this.id, required this.name});
  factory _VolunteerScheduleAnon.fromJson(Map<String, dynamic> json) =>
      _$VolunteerScheduleAnonFromJson(json);

  @override
  final int id;
  @override
  final String name;

  /// Create a copy of VolunteerScheduleAnon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolunteerScheduleAnonCopyWith<_VolunteerScheduleAnon> get copyWith =>
      __$VolunteerScheduleAnonCopyWithImpl<_VolunteerScheduleAnon>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolunteerScheduleAnonToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolunteerScheduleAnon &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'VolunteerScheduleAnon(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$VolunteerScheduleAnonCopyWith<$Res>
    implements $VolunteerScheduleAnonCopyWith<$Res> {
  factory _$VolunteerScheduleAnonCopyWith(_VolunteerScheduleAnon value,
          $Res Function(_VolunteerScheduleAnon) _then) =
      __$VolunteerScheduleAnonCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$VolunteerScheduleAnonCopyWithImpl<$Res>
    implements _$VolunteerScheduleAnonCopyWith<$Res> {
  __$VolunteerScheduleAnonCopyWithImpl(this._self, this._then);

  final _VolunteerScheduleAnon _self;
  final $Res Function(_VolunteerScheduleAnon) _then;

  /// Create a copy of VolunteerScheduleAnon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_VolunteerScheduleAnon(
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
