// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liturgical_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiturgicalEvent {
  String get summary;
  String? get description;

  /// Create a copy of LiturgicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiturgicalEventCopyWith<LiturgicalEvent> get copyWith =>
      _$LiturgicalEventCopyWithImpl<LiturgicalEvent>(
          this as LiturgicalEvent, _$identity);

  /// Serializes this LiturgicalEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiturgicalEvent &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, summary, description);

  @override
  String toString() {
    return 'LiturgicalEvent(summary: $summary, description: $description)';
  }
}

/// @nodoc
abstract mixin class $LiturgicalEventCopyWith<$Res> {
  factory $LiturgicalEventCopyWith(
          LiturgicalEvent value, $Res Function(LiturgicalEvent) _then) =
      _$LiturgicalEventCopyWithImpl;
  @useResult
  $Res call({String summary, String? description});
}

/// @nodoc
class _$LiturgicalEventCopyWithImpl<$Res>
    implements $LiturgicalEventCopyWith<$Res> {
  _$LiturgicalEventCopyWithImpl(this._self, this._then);

  final LiturgicalEvent _self;
  final $Res Function(LiturgicalEvent) _then;

  /// Create a copy of LiturgicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LiturgicalEvent implements LiturgicalEvent {
  const _LiturgicalEvent({required this.summary, required this.description});
  factory _LiturgicalEvent.fromJson(Map<String, dynamic> json) =>
      _$LiturgicalEventFromJson(json);

  @override
  final String summary;
  @override
  final String? description;

  /// Create a copy of LiturgicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiturgicalEventCopyWith<_LiturgicalEvent> get copyWith =>
      __$LiturgicalEventCopyWithImpl<_LiturgicalEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LiturgicalEventToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiturgicalEvent &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, summary, description);

  @override
  String toString() {
    return 'LiturgicalEvent(summary: $summary, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$LiturgicalEventCopyWith<$Res>
    implements $LiturgicalEventCopyWith<$Res> {
  factory _$LiturgicalEventCopyWith(
          _LiturgicalEvent value, $Res Function(_LiturgicalEvent) _then) =
      __$LiturgicalEventCopyWithImpl;
  @override
  @useResult
  $Res call({String summary, String? description});
}

/// @nodoc
class __$LiturgicalEventCopyWithImpl<$Res>
    implements _$LiturgicalEventCopyWith<$Res> {
  __$LiturgicalEventCopyWithImpl(this._self, this._then);

  final _LiturgicalEvent _self;
  final $Res Function(_LiturgicalEvent) _then;

  /// Create a copy of LiturgicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
    Object? description = freezed,
  }) {
    return _then(_LiturgicalEvent(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
