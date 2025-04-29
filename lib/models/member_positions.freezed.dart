// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_positions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberPositions {
  String get id;
  String get name;
  String get baptismalName;
  List<Position> get positions;

  /// Create a copy of MemberPositions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberPositionsCopyWith<MemberPositions> get copyWith =>
      _$MemberPositionsCopyWithImpl<MemberPositions>(
          this as MemberPositions, _$identity);

  /// Serializes this MemberPositions to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberPositions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baptismalName, baptismalName) ||
                other.baptismalName == baptismalName) &&
            const DeepCollectionEquality().equals(other.positions, positions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, baptismalName,
      const DeepCollectionEquality().hash(positions));

  @override
  String toString() {
    return 'MemberPositions(id: $id, name: $name, baptismalName: $baptismalName, positions: $positions)';
  }
}

/// @nodoc
abstract mixin class $MemberPositionsCopyWith<$Res> {
  factory $MemberPositionsCopyWith(
          MemberPositions value, $Res Function(MemberPositions) _then) =
      _$MemberPositionsCopyWithImpl;
  @useResult
  $Res call(
      {String id, String name, String baptismalName, List<Position> positions});
}

/// @nodoc
class _$MemberPositionsCopyWithImpl<$Res>
    implements $MemberPositionsCopyWith<$Res> {
  _$MemberPositionsCopyWithImpl(this._self, this._then);

  final MemberPositions _self;
  final $Res Function(MemberPositions) _then;

  /// Create a copy of MemberPositions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baptismalName = null,
    Object? positions = null,
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
      baptismalName: null == baptismalName
          ? _self.baptismalName
          : baptismalName // ignore: cast_nullable_to_non_nullable
              as String,
      positions: null == positions
          ? _self.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<Position>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MemberPositions implements MemberPositions {
  const _MemberPositions(
      {required this.id,
      required this.name,
      required this.baptismalName,
      required final List<Position> positions})
      : _positions = positions;
  factory _MemberPositions.fromJson(Map<String, dynamic> json) =>
      _$MemberPositionsFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String baptismalName;
  final List<Position> _positions;
  @override
  List<Position> get positions {
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_positions);
  }

  /// Create a copy of MemberPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberPositionsCopyWith<_MemberPositions> get copyWith =>
      __$MemberPositionsCopyWithImpl<_MemberPositions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MemberPositionsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberPositions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baptismalName, baptismalName) ||
                other.baptismalName == baptismalName) &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, baptismalName,
      const DeepCollectionEquality().hash(_positions));

  @override
  String toString() {
    return 'MemberPositions(id: $id, name: $name, baptismalName: $baptismalName, positions: $positions)';
  }
}

/// @nodoc
abstract mixin class _$MemberPositionsCopyWith<$Res>
    implements $MemberPositionsCopyWith<$Res> {
  factory _$MemberPositionsCopyWith(
          _MemberPositions value, $Res Function(_MemberPositions) _then) =
      __$MemberPositionsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id, String name, String baptismalName, List<Position> positions});
}

/// @nodoc
class __$MemberPositionsCopyWithImpl<$Res>
    implements _$MemberPositionsCopyWith<$Res> {
  __$MemberPositionsCopyWithImpl(this._self, this._then);

  final _MemberPositions _self;
  final $Res Function(_MemberPositions) _then;

  /// Create a copy of MemberPositions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baptismalName = null,
    Object? positions = null,
  }) {
    return _then(_MemberPositions(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baptismalName: null == baptismalName
          ? _self.baptismalName
          : baptismalName // ignore: cast_nullable_to_non_nullable
              as String,
      positions: null == positions
          ? _self._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<Position>,
    ));
  }
}

// dart format on
