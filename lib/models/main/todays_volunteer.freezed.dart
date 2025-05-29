// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todays_volunteer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodaysVolunteer {
  int get id;
  Position get position;
  TamimUser? get user;
  VolunteerScheduleAnon? get anon;

  /// Create a copy of TodaysVolunteer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TodaysVolunteerCopyWith<TodaysVolunteer> get copyWith =>
      _$TodaysVolunteerCopyWithImpl<TodaysVolunteer>(
          this as TodaysVolunteer, _$identity);

  /// Serializes this TodaysVolunteer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TodaysVolunteer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.anon, anon) || other.anon == anon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, position, user, anon);

  @override
  String toString() {
    return 'TodaysVolunteer(id: $id, position: $position, user: $user, anon: $anon)';
  }
}

/// @nodoc
abstract mixin class $TodaysVolunteerCopyWith<$Res> {
  factory $TodaysVolunteerCopyWith(
          TodaysVolunteer value, $Res Function(TodaysVolunteer) _then) =
      _$TodaysVolunteerCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      Position position,
      TamimUser? user,
      VolunteerScheduleAnon? anon});

  $PositionCopyWith<$Res> get position;
  $TamimUserCopyWith<$Res>? get user;
  $VolunteerScheduleAnonCopyWith<$Res>? get anon;
}

/// @nodoc
class _$TodaysVolunteerCopyWithImpl<$Res>
    implements $TodaysVolunteerCopyWith<$Res> {
  _$TodaysVolunteerCopyWithImpl(this._self, this._then);

  final TodaysVolunteer _self;
  final $Res Function(TodaysVolunteer) _then;

  /// Create a copy of TodaysVolunteer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? user = freezed,
    Object? anon = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as TamimUser?,
      anon: freezed == anon
          ? _self.anon
          : anon // ignore: cast_nullable_to_non_nullable
              as VolunteerScheduleAnon?,
    ));
  }

  /// Create a copy of TodaysVolunteer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get position {
    return $PositionCopyWith<$Res>(_self.position, (value) {
      return _then(_self.copyWith(position: value));
    });
  }

  /// Create a copy of TodaysVolunteer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TamimUserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $TamimUserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of TodaysVolunteer
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
class _TodaysVolunteer implements TodaysVolunteer {
  const _TodaysVolunteer(
      {required this.id,
      required this.position,
      required this.user,
      required this.anon});
  factory _TodaysVolunteer.fromJson(Map<String, dynamic> json) =>
      _$TodaysVolunteerFromJson(json);

  @override
  final int id;
  @override
  final Position position;
  @override
  final TamimUser? user;
  @override
  final VolunteerScheduleAnon? anon;

  /// Create a copy of TodaysVolunteer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TodaysVolunteerCopyWith<_TodaysVolunteer> get copyWith =>
      __$TodaysVolunteerCopyWithImpl<_TodaysVolunteer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TodaysVolunteerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodaysVolunteer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.anon, anon) || other.anon == anon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, position, user, anon);

  @override
  String toString() {
    return 'TodaysVolunteer(id: $id, position: $position, user: $user, anon: $anon)';
  }
}

/// @nodoc
abstract mixin class _$TodaysVolunteerCopyWith<$Res>
    implements $TodaysVolunteerCopyWith<$Res> {
  factory _$TodaysVolunteerCopyWith(
          _TodaysVolunteer value, $Res Function(_TodaysVolunteer) _then) =
      __$TodaysVolunteerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      Position position,
      TamimUser? user,
      VolunteerScheduleAnon? anon});

  @override
  $PositionCopyWith<$Res> get position;
  @override
  $TamimUserCopyWith<$Res>? get user;
  @override
  $VolunteerScheduleAnonCopyWith<$Res>? get anon;
}

/// @nodoc
class __$TodaysVolunteerCopyWithImpl<$Res>
    implements _$TodaysVolunteerCopyWith<$Res> {
  __$TodaysVolunteerCopyWithImpl(this._self, this._then);

  final _TodaysVolunteer _self;
  final $Res Function(_TodaysVolunteer) _then;

  /// Create a copy of TodaysVolunteer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? user = freezed,
    Object? anon = freezed,
  }) {
    return _then(_TodaysVolunteer(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as TamimUser?,
      anon: freezed == anon
          ? _self.anon
          : anon // ignore: cast_nullable_to_non_nullable
              as VolunteerScheduleAnon?,
    ));
  }

  /// Create a copy of TodaysVolunteer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get position {
    return $PositionCopyWith<$Res>(_self.position, (value) {
      return _then(_self.copyWith(position: value));
    });
  }

  /// Create a copy of TodaysVolunteer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TamimUserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $TamimUserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of TodaysVolunteer
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
