// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleEvent {
  int get id;
  DateTime get scheduleDatetime;
  ParishGroup get parishGroup;
  TamimUser get tamimUser;
  String get scheduleName;
  String get scheduleDesc;
  String get openChatUrl;
  int get recruiteCount;
  String get shareScope;

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleEventCopyWith<ScheduleEvent> get copyWith =>
      _$ScheduleEventCopyWithImpl<ScheduleEvent>(
          this as ScheduleEvent, _$identity);

  /// Serializes this ScheduleEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scheduleDatetime, scheduleDatetime) ||
                other.scheduleDatetime == scheduleDatetime) &&
            (identical(other.parishGroup, parishGroup) ||
                other.parishGroup == parishGroup) &&
            (identical(other.tamimUser, tamimUser) ||
                other.tamimUser == tamimUser) &&
            (identical(other.scheduleName, scheduleName) ||
                other.scheduleName == scheduleName) &&
            (identical(other.scheduleDesc, scheduleDesc) ||
                other.scheduleDesc == scheduleDesc) &&
            (identical(other.openChatUrl, openChatUrl) ||
                other.openChatUrl == openChatUrl) &&
            (identical(other.recruiteCount, recruiteCount) ||
                other.recruiteCount == recruiteCount) &&
            (identical(other.shareScope, shareScope) ||
                other.shareScope == shareScope));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      scheduleDatetime,
      parishGroup,
      tamimUser,
      scheduleName,
      scheduleDesc,
      openChatUrl,
      recruiteCount,
      shareScope);

  @override
  String toString() {
    return 'ScheduleEvent(id: $id, scheduleDatetime: $scheduleDatetime, parishGroup: $parishGroup, tamimUser: $tamimUser, scheduleName: $scheduleName, scheduleDesc: $scheduleDesc, openChatUrl: $openChatUrl, recruiteCount: $recruiteCount, shareScope: $shareScope)';
  }
}

/// @nodoc
abstract mixin class $ScheduleEventCopyWith<$Res> {
  factory $ScheduleEventCopyWith(
          ScheduleEvent value, $Res Function(ScheduleEvent) _then) =
      _$ScheduleEventCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      DateTime scheduleDatetime,
      ParishGroup parishGroup,
      TamimUser tamimUser,
      String scheduleName,
      String scheduleDesc,
      String openChatUrl,
      int recruiteCount,
      String shareScope});

  $ParishGroupCopyWith<$Res> get parishGroup;
  $TamimUserCopyWith<$Res> get tamimUser;
}

/// @nodoc
class _$ScheduleEventCopyWithImpl<$Res>
    implements $ScheduleEventCopyWith<$Res> {
  _$ScheduleEventCopyWithImpl(this._self, this._then);

  final ScheduleEvent _self;
  final $Res Function(ScheduleEvent) _then;

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scheduleDatetime = null,
    Object? parishGroup = null,
    Object? tamimUser = null,
    Object? scheduleName = null,
    Object? scheduleDesc = null,
    Object? openChatUrl = null,
    Object? recruiteCount = null,
    Object? shareScope = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleDatetime: null == scheduleDatetime
          ? _self.scheduleDatetime
          : scheduleDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      parishGroup: null == parishGroup
          ? _self.parishGroup
          : parishGroup // ignore: cast_nullable_to_non_nullable
              as ParishGroup,
      tamimUser: null == tamimUser
          ? _self.tamimUser
          : tamimUser // ignore: cast_nullable_to_non_nullable
              as TamimUser,
      scheduleName: null == scheduleName
          ? _self.scheduleName
          : scheduleName // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleDesc: null == scheduleDesc
          ? _self.scheduleDesc
          : scheduleDesc // ignore: cast_nullable_to_non_nullable
              as String,
      openChatUrl: null == openChatUrl
          ? _self.openChatUrl
          : openChatUrl // ignore: cast_nullable_to_non_nullable
              as String,
      recruiteCount: null == recruiteCount
          ? _self.recruiteCount
          : recruiteCount // ignore: cast_nullable_to_non_nullable
              as int,
      shareScope: null == shareScope
          ? _self.shareScope
          : shareScope // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishGroupCopyWith<$Res> get parishGroup {
    return $ParishGroupCopyWith<$Res>(_self.parishGroup, (value) {
      return _then(_self.copyWith(parishGroup: value));
    });
  }

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TamimUserCopyWith<$Res> get tamimUser {
    return $TamimUserCopyWith<$Res>(_self.tamimUser, (value) {
      return _then(_self.copyWith(tamimUser: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ScheduleEvent implements ScheduleEvent {
  const _ScheduleEvent(
      {required this.id,
      required this.scheduleDatetime,
      required this.parishGroup,
      required this.tamimUser,
      required this.scheduleName,
      required this.scheduleDesc,
      required this.openChatUrl,
      required this.recruiteCount,
      required this.shareScope});
  factory _ScheduleEvent.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEventFromJson(json);

  @override
  final int id;
  @override
  final DateTime scheduleDatetime;
  @override
  final ParishGroup parishGroup;
  @override
  final TamimUser tamimUser;
  @override
  final String scheduleName;
  @override
  final String scheduleDesc;
  @override
  final String openChatUrl;
  @override
  final int recruiteCount;
  @override
  final String shareScope;

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleEventCopyWith<_ScheduleEvent> get copyWith =>
      __$ScheduleEventCopyWithImpl<_ScheduleEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scheduleDatetime, scheduleDatetime) ||
                other.scheduleDatetime == scheduleDatetime) &&
            (identical(other.parishGroup, parishGroup) ||
                other.parishGroup == parishGroup) &&
            (identical(other.tamimUser, tamimUser) ||
                other.tamimUser == tamimUser) &&
            (identical(other.scheduleName, scheduleName) ||
                other.scheduleName == scheduleName) &&
            (identical(other.scheduleDesc, scheduleDesc) ||
                other.scheduleDesc == scheduleDesc) &&
            (identical(other.openChatUrl, openChatUrl) ||
                other.openChatUrl == openChatUrl) &&
            (identical(other.recruiteCount, recruiteCount) ||
                other.recruiteCount == recruiteCount) &&
            (identical(other.shareScope, shareScope) ||
                other.shareScope == shareScope));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      scheduleDatetime,
      parishGroup,
      tamimUser,
      scheduleName,
      scheduleDesc,
      openChatUrl,
      recruiteCount,
      shareScope);

  @override
  String toString() {
    return 'ScheduleEvent(id: $id, scheduleDatetime: $scheduleDatetime, parishGroup: $parishGroup, tamimUser: $tamimUser, scheduleName: $scheduleName, scheduleDesc: $scheduleDesc, openChatUrl: $openChatUrl, recruiteCount: $recruiteCount, shareScope: $shareScope)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleEventCopyWith<$Res>
    implements $ScheduleEventCopyWith<$Res> {
  factory _$ScheduleEventCopyWith(
          _ScheduleEvent value, $Res Function(_ScheduleEvent) _then) =
      __$ScheduleEventCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime scheduleDatetime,
      ParishGroup parishGroup,
      TamimUser tamimUser,
      String scheduleName,
      String scheduleDesc,
      String openChatUrl,
      int recruiteCount,
      String shareScope});

  @override
  $ParishGroupCopyWith<$Res> get parishGroup;
  @override
  $TamimUserCopyWith<$Res> get tamimUser;
}

/// @nodoc
class __$ScheduleEventCopyWithImpl<$Res>
    implements _$ScheduleEventCopyWith<$Res> {
  __$ScheduleEventCopyWithImpl(this._self, this._then);

  final _ScheduleEvent _self;
  final $Res Function(_ScheduleEvent) _then;

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? scheduleDatetime = null,
    Object? parishGroup = null,
    Object? tamimUser = null,
    Object? scheduleName = null,
    Object? scheduleDesc = null,
    Object? openChatUrl = null,
    Object? recruiteCount = null,
    Object? shareScope = null,
  }) {
    return _then(_ScheduleEvent(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleDatetime: null == scheduleDatetime
          ? _self.scheduleDatetime
          : scheduleDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      parishGroup: null == parishGroup
          ? _self.parishGroup
          : parishGroup // ignore: cast_nullable_to_non_nullable
              as ParishGroup,
      tamimUser: null == tamimUser
          ? _self.tamimUser
          : tamimUser // ignore: cast_nullable_to_non_nullable
              as TamimUser,
      scheduleName: null == scheduleName
          ? _self.scheduleName
          : scheduleName // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleDesc: null == scheduleDesc
          ? _self.scheduleDesc
          : scheduleDesc // ignore: cast_nullable_to_non_nullable
              as String,
      openChatUrl: null == openChatUrl
          ? _self.openChatUrl
          : openChatUrl // ignore: cast_nullable_to_non_nullable
              as String,
      recruiteCount: null == recruiteCount
          ? _self.recruiteCount
          : recruiteCount // ignore: cast_nullable_to_non_nullable
              as int,
      shareScope: null == shareScope
          ? _self.shareScope
          : shareScope // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ParishGroupCopyWith<$Res> get parishGroup {
    return $ParishGroupCopyWith<$Res>(_self.parishGroup, (value) {
      return _then(_self.copyWith(parishGroup: value));
    });
  }

  /// Create a copy of ScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TamimUserCopyWith<$Res> get tamimUser {
    return $TamimUserCopyWith<$Res>(_self.tamimUser, (value) {
      return _then(_self.copyWith(tamimUser: value));
    });
  }
}

// dart format on
