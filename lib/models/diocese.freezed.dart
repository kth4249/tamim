// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diocese.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Diocese {

 int get id; String get dioceseName; DateTime get createdAt;
/// Create a copy of Diocese
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DioceseCopyWith<Diocese> get copyWith => _$DioceseCopyWithImpl<Diocese>(this as Diocese, _$identity);

  /// Serializes this Diocese to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Diocese&&(identical(other.id, id) || other.id == id)&&(identical(other.dioceseName, dioceseName) || other.dioceseName == dioceseName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dioceseName,createdAt);

@override
String toString() {
  return 'Diocese(id: $id, dioceseName: $dioceseName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DioceseCopyWith<$Res>  {
  factory $DioceseCopyWith(Diocese value, $Res Function(Diocese) _then) = _$DioceseCopyWithImpl;
@useResult
$Res call({
 int id, String dioceseName, DateTime createdAt
});




}
/// @nodoc
class _$DioceseCopyWithImpl<$Res>
    implements $DioceseCopyWith<$Res> {
  _$DioceseCopyWithImpl(this._self, this._then);

  final Diocese _self;
  final $Res Function(Diocese) _then;

/// Create a copy of Diocese
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dioceseName = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dioceseName: null == dioceseName ? _self.dioceseName : dioceseName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Diocese implements Diocese {
  const _Diocese({required this.id, required this.dioceseName, required this.createdAt});
  factory _Diocese.fromJson(Map<String, dynamic> json) => _$DioceseFromJson(json);

@override final  int id;
@override final  String dioceseName;
@override final  DateTime createdAt;

/// Create a copy of Diocese
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DioceseCopyWith<_Diocese> get copyWith => __$DioceseCopyWithImpl<_Diocese>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DioceseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Diocese&&(identical(other.id, id) || other.id == id)&&(identical(other.dioceseName, dioceseName) || other.dioceseName == dioceseName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dioceseName,createdAt);

@override
String toString() {
  return 'Diocese(id: $id, dioceseName: $dioceseName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DioceseCopyWith<$Res> implements $DioceseCopyWith<$Res> {
  factory _$DioceseCopyWith(_Diocese value, $Res Function(_Diocese) _then) = __$DioceseCopyWithImpl;
@override @useResult
$Res call({
 int id, String dioceseName, DateTime createdAt
});




}
/// @nodoc
class __$DioceseCopyWithImpl<$Res>
    implements _$DioceseCopyWith<$Res> {
  __$DioceseCopyWithImpl(this._self, this._then);

  final _Diocese _self;
  final $Res Function(_Diocese) _then;

/// Create a copy of Diocese
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dioceseName = null,Object? createdAt = null,}) {
  return _then(_Diocese(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dioceseName: null == dioceseName ? _self.dioceseName : dioceseName // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
