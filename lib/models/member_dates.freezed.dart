// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_dates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberDates {
  String get id;
  String get name;
  String? get baptismalName;
  List<DateTime> get memberDates;

  /// Create a copy of MemberDates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberDatesCopyWith<MemberDates> get copyWith =>
      _$MemberDatesCopyWithImpl<MemberDates>(this as MemberDates, _$identity);

  /// Serializes this MemberDates to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberDates &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baptismalName, baptismalName) ||
                other.baptismalName == baptismalName) &&
            const DeepCollectionEquality()
                .equals(other.memberDates, memberDates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, baptismalName,
      const DeepCollectionEquality().hash(memberDates));

  @override
  String toString() {
    return 'MemberDates(id: $id, name: $name, baptismalName: $baptismalName, memberDates: $memberDates)';
  }
}

/// @nodoc
abstract mixin class $MemberDatesCopyWith<$Res> {
  factory $MemberDatesCopyWith(
          MemberDates value, $Res Function(MemberDates) _then) =
      _$MemberDatesCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? baptismalName,
      List<DateTime> memberDates});
}

/// @nodoc
class _$MemberDatesCopyWithImpl<$Res> implements $MemberDatesCopyWith<$Res> {
  _$MemberDatesCopyWithImpl(this._self, this._then);

  final MemberDates _self;
  final $Res Function(MemberDates) _then;

  /// Create a copy of MemberDates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baptismalName = freezed,
    Object? memberDates = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baptismalName: freezed == baptismalName
          ? _self.baptismalName
          : baptismalName // ignore: cast_nullable_to_non_nullable
              as String?,
      memberDates: null == memberDates
          ? _self.memberDates
          : memberDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MemberDates implements MemberDates {
  const _MemberDates(
      {required this.id,
      required this.name,
      required this.baptismalName,
      required final List<DateTime> memberDates})
      : _memberDates = memberDates;
  factory _MemberDates.fromJson(Map<String, dynamic> json) =>
      _$MemberDatesFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? baptismalName;
  final List<DateTime> _memberDates;
  @override
  List<DateTime> get memberDates {
    if (_memberDates is EqualUnmodifiableListView) return _memberDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberDates);
  }

  /// Create a copy of MemberDates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberDatesCopyWith<_MemberDates> get copyWith =>
      __$MemberDatesCopyWithImpl<_MemberDates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MemberDatesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberDates &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baptismalName, baptismalName) ||
                other.baptismalName == baptismalName) &&
            const DeepCollectionEquality()
                .equals(other._memberDates, _memberDates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, baptismalName,
      const DeepCollectionEquality().hash(_memberDates));

  @override
  String toString() {
    return 'MemberDates(id: $id, name: $name, baptismalName: $baptismalName, memberDates: $memberDates)';
  }
}

/// @nodoc
abstract mixin class _$MemberDatesCopyWith<$Res>
    implements $MemberDatesCopyWith<$Res> {
  factory _$MemberDatesCopyWith(
          _MemberDates value, $Res Function(_MemberDates) _then) =
      __$MemberDatesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? baptismalName,
      List<DateTime> memberDates});
}

/// @nodoc
class __$MemberDatesCopyWithImpl<$Res> implements _$MemberDatesCopyWith<$Res> {
  __$MemberDatesCopyWithImpl(this._self, this._then);

  final _MemberDates _self;
  final $Res Function(_MemberDates) _then;

  /// Create a copy of MemberDates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baptismalName = freezed,
    Object? memberDates = null,
  }) {
    return _then(_MemberDates(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baptismalName: freezed == baptismalName
          ? _self.baptismalName
          : baptismalName // ignore: cast_nullable_to_non_nullable
              as String?,
      memberDates: null == memberDates
          ? _self._memberDates
          : memberDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

// dart format on
