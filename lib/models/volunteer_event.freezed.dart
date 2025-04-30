// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolunteerEvent {
  int get id;
  DateTime get volunteerDate;
  Position get position;
  UserInfo? get user;
  VolunteerScheduleAnon? get anon;

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolunteerEventCopyWith<VolunteerEvent> get copyWith =>
      _$VolunteerEventCopyWithImpl<VolunteerEvent>(
          this as VolunteerEvent, _$identity);

  /// Serializes this VolunteerEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolunteerEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volunteerDate, volunteerDate) ||
                other.volunteerDate == volunteerDate) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.anon, anon) || other.anon == anon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, volunteerDate, position, user, anon);

  @override
  String toString() {
    return 'VolunteerEvent(id: $id, volunteerDate: $volunteerDate, position: $position, user: $user, anon: $anon)';
  }
}

/// @nodoc
abstract mixin class $VolunteerEventCopyWith<$Res> {
  factory $VolunteerEventCopyWith(
          VolunteerEvent value, $Res Function(VolunteerEvent) _then) =
      _$VolunteerEventCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      DateTime volunteerDate,
      Position position,
      UserInfo? user,
      VolunteerScheduleAnon? anon});

  $PositionCopyWith<$Res> get position;
  $UserInfoCopyWith<$Res>? get user;
  $VolunteerScheduleAnonCopyWith<$Res>? get anon;
}

/// @nodoc
class _$VolunteerEventCopyWithImpl<$Res>
    implements $VolunteerEventCopyWith<$Res> {
  _$VolunteerEventCopyWithImpl(this._self, this._then);

  final VolunteerEvent _self;
  final $Res Function(VolunteerEvent) _then;

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? volunteerDate = null,
    Object? position = null,
    Object? user = freezed,
    Object? anon = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      volunteerDate: null == volunteerDate
          ? _self.volunteerDate
          : volunteerDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      anon: freezed == anon
          ? _self.anon
          : anon // ignore: cast_nullable_to_non_nullable
              as VolunteerScheduleAnon?,
    ));
  }

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get position {
    return $PositionCopyWith<$Res>(_self.position, (value) {
      return _then(_self.copyWith(position: value));
    });
  }

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VolunteerScheduleAnonCopyWith<$Res>? get anon {
    if (_self.anon == null) {
      return null;
    }

    return $VolunteerScheduleAnonCopyWith<$Res>(_self.anon!, (value) {
      return _then(_self.copyWith(anon: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _VolunteerEvent implements VolunteerEvent {
  const _VolunteerEvent(
      {required this.id,
      required this.volunteerDate,
      required this.position,
      required this.user,
      required this.anon});
  factory _VolunteerEvent.fromJson(Map<String, dynamic> json) =>
      _$VolunteerEventFromJson(json);

  @override
  final int id;
  @override
  final DateTime volunteerDate;
  @override
  final Position position;
  @override
  final UserInfo? user;
  @override
  final VolunteerScheduleAnon? anon;

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolunteerEventCopyWith<_VolunteerEvent> get copyWith =>
      __$VolunteerEventCopyWithImpl<_VolunteerEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolunteerEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolunteerEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.volunteerDate, volunteerDate) ||
                other.volunteerDate == volunteerDate) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.anon, anon) || other.anon == anon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, volunteerDate, position, user, anon);

  @override
  String toString() {
    return 'VolunteerEvent(id: $id, volunteerDate: $volunteerDate, position: $position, user: $user, anon: $anon)';
  }
}

/// @nodoc
abstract mixin class _$VolunteerEventCopyWith<$Res>
    implements $VolunteerEventCopyWith<$Res> {
  factory _$VolunteerEventCopyWith(
          _VolunteerEvent value, $Res Function(_VolunteerEvent) _then) =
      __$VolunteerEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime volunteerDate,
      Position position,
      UserInfo? user,
      VolunteerScheduleAnon? anon});

  @override
  $PositionCopyWith<$Res> get position;
  @override
  $UserInfoCopyWith<$Res>? get user;
  @override
  $VolunteerScheduleAnonCopyWith<$Res>? get anon;
}

/// @nodoc
class __$VolunteerEventCopyWithImpl<$Res>
    implements _$VolunteerEventCopyWith<$Res> {
  __$VolunteerEventCopyWithImpl(this._self, this._then);

  final _VolunteerEvent _self;
  final $Res Function(_VolunteerEvent) _then;

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? volunteerDate = null,
    Object? position = null,
    Object? user = freezed,
    Object? anon = freezed,
  }) {
    return _then(_VolunteerEvent(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      volunteerDate: null == volunteerDate
          ? _self.volunteerDate
          : volunteerDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      anon: freezed == anon
          ? _self.anon
          : anon // ignore: cast_nullable_to_non_nullable
              as VolunteerScheduleAnon?,
    ));
  }

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get position {
    return $PositionCopyWith<$Res>(_self.position, (value) {
      return _then(_self.copyWith(position: value));
    });
  }

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserInfoCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of VolunteerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VolunteerScheduleAnonCopyWith<$Res>? get anon {
    if (_self.anon == null) {
      return null;
    }

    return $VolunteerScheduleAnonCopyWith<$Res>(_self.anon!, (value) {
      return _then(_self.copyWith(anon: value));
    });
  }
}

// dart format on
