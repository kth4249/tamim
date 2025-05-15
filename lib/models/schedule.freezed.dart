// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Schedule {
  int get id;
  DateTime get scheduleDatetime;
  int get groupId;
  String get userId;
  String get scheduleName;
  String? get scheduleDesc;
  String? get openChatUrl;
  int get recruiteCount;
  String get shareScope;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<Schedule> get copyWith =>
      _$ScheduleCopyWithImpl<Schedule>(this as Schedule, _$identity);

  /// Serializes this Schedule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scheduleDatetime, scheduleDatetime) ||
                other.scheduleDatetime == scheduleDatetime) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
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
      groupId,
      userId,
      scheduleName,
      scheduleDesc,
      openChatUrl,
      recruiteCount,
      shareScope);

  @override
  String toString() {
    return 'Schedule(id: $id, scheduleDatetime: $scheduleDatetime, groupId: $groupId, userId: $userId, scheduleName: $scheduleName, scheduleDesc: $scheduleDesc, openChatUrl: $openChatUrl, recruiteCount: $recruiteCount, shareScope: $shareScope)';
  }
}

/// @nodoc
abstract mixin class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) _then) =
      _$ScheduleCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      DateTime scheduleDatetime,
      int groupId,
      String userId,
      String scheduleName,
      String? scheduleDesc,
      String? openChatUrl,
      int recruiteCount,
      String shareScope});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res> implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._self, this._then);

  final Schedule _self;
  final $Res Function(Schedule) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scheduleDatetime = null,
    Object? groupId = null,
    Object? userId = null,
    Object? scheduleName = null,
    Object? scheduleDesc = freezed,
    Object? openChatUrl = freezed,
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
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleName: null == scheduleName
          ? _self.scheduleName
          : scheduleName // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleDesc: freezed == scheduleDesc
          ? _self.scheduleDesc
          : scheduleDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      openChatUrl: freezed == openChatUrl
          ? _self.openChatUrl
          : openChatUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

/// @nodoc
@JsonSerializable()
class _Schedule implements Schedule {
  const _Schedule(
      {required this.id,
      required this.scheduleDatetime,
      required this.groupId,
      required this.userId,
      required this.scheduleName,
      required this.scheduleDesc,
      required this.openChatUrl,
      required this.recruiteCount,
      required this.shareScope});
  factory _Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  @override
  final int id;
  @override
  final DateTime scheduleDatetime;
  @override
  final int groupId;
  @override
  final String userId;
  @override
  final String scheduleName;
  @override
  final String? scheduleDesc;
  @override
  final String? openChatUrl;
  @override
  final int recruiteCount;
  @override
  final String shareScope;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleCopyWith<_Schedule> get copyWith =>
      __$ScheduleCopyWithImpl<_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scheduleDatetime, scheduleDatetime) ||
                other.scheduleDatetime == scheduleDatetime) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
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
      groupId,
      userId,
      scheduleName,
      scheduleDesc,
      openChatUrl,
      recruiteCount,
      shareScope);

  @override
  String toString() {
    return 'Schedule(id: $id, scheduleDatetime: $scheduleDatetime, groupId: $groupId, userId: $userId, scheduleName: $scheduleName, scheduleDesc: $scheduleDesc, openChatUrl: $openChatUrl, recruiteCount: $recruiteCount, shareScope: $shareScope)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleCopyWith<$Res>
    implements $ScheduleCopyWith<$Res> {
  factory _$ScheduleCopyWith(_Schedule value, $Res Function(_Schedule) _then) =
      __$ScheduleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime scheduleDatetime,
      int groupId,
      String userId,
      String scheduleName,
      String? scheduleDesc,
      String? openChatUrl,
      int recruiteCount,
      String shareScope});
}

/// @nodoc
class __$ScheduleCopyWithImpl<$Res> implements _$ScheduleCopyWith<$Res> {
  __$ScheduleCopyWithImpl(this._self, this._then);

  final _Schedule _self;
  final $Res Function(_Schedule) _then;

  /// Create a copy of Schedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? scheduleDatetime = null,
    Object? groupId = null,
    Object? userId = null,
    Object? scheduleName = null,
    Object? scheduleDesc = freezed,
    Object? openChatUrl = freezed,
    Object? recruiteCount = null,
    Object? shareScope = null,
  }) {
    return _then(_Schedule(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      scheduleDatetime: null == scheduleDatetime
          ? _self.scheduleDatetime
          : scheduleDatetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      groupId: null == groupId
          ? _self.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleName: null == scheduleName
          ? _self.scheduleName
          : scheduleName // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleDesc: freezed == scheduleDesc
          ? _self.scheduleDesc
          : scheduleDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      openChatUrl: freezed == openChatUrl
          ? _self.openChatUrl
          : openChatUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

// dart format on
