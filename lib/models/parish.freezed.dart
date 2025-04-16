// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parish.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Parish {

 int get id;@JsonKey(name: 'diocese_id') int get dioceseId;@JsonKey(name: 'parish_name') String get parishName;@JsonKey(name: 'register_key') String get registerKey;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of Parish
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParishCopyWith<Parish> get copyWith => _$ParishCopyWithImpl<Parish>(this as Parish, _$identity);

  /// Serializes this Parish to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Parish&&(identical(other.id, id) || other.id == id)&&(identical(other.dioceseId, dioceseId) || other.dioceseId == dioceseId)&&(identical(other.parishName, parishName) || other.parishName == parishName)&&(identical(other.registerKey, registerKey) || other.registerKey == registerKey)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dioceseId,parishName,registerKey,createdAt);

@override
String toString() {
  return 'Parish(id: $id, dioceseId: $dioceseId, parishName: $parishName, registerKey: $registerKey, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ParishCopyWith<$Res>  {
  factory $ParishCopyWith(Parish value, $Res Function(Parish) _then) = _$ParishCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'diocese_id') int dioceseId,@JsonKey(name: 'parish_name') String parishName,@JsonKey(name: 'register_key') String registerKey,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$ParishCopyWithImpl<$Res>
    implements $ParishCopyWith<$Res> {
  _$ParishCopyWithImpl(this._self, this._then);

  final Parish _self;
  final $Res Function(Parish) _then;

/// Create a copy of Parish
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dioceseId = null,Object? parishName = null,Object? registerKey = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dioceseId: null == dioceseId ? _self.dioceseId : dioceseId // ignore: cast_nullable_to_non_nullable
as int,parishName: null == parishName ? _self.parishName : parishName // ignore: cast_nullable_to_non_nullable
as String,registerKey: null == registerKey ? _self.registerKey : registerKey // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Parish implements Parish {
  const _Parish({required this.id, @JsonKey(name: 'diocese_id') required this.dioceseId, @JsonKey(name: 'parish_name') required this.parishName, @JsonKey(name: 'register_key') required this.registerKey, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Parish.fromJson(Map<String, dynamic> json) => _$ParishFromJson(json);

@override final  int id;
@override@JsonKey(name: 'diocese_id') final  int dioceseId;
@override@JsonKey(name: 'parish_name') final  String parishName;
@override@JsonKey(name: 'register_key') final  String registerKey;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of Parish
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParishCopyWith<_Parish> get copyWith => __$ParishCopyWithImpl<_Parish>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParishToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Parish&&(identical(other.id, id) || other.id == id)&&(identical(other.dioceseId, dioceseId) || other.dioceseId == dioceseId)&&(identical(other.parishName, parishName) || other.parishName == parishName)&&(identical(other.registerKey, registerKey) || other.registerKey == registerKey)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,dioceseId,parishName,registerKey,createdAt);

@override
String toString() {
  return 'Parish(id: $id, dioceseId: $dioceseId, parishName: $parishName, registerKey: $registerKey, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ParishCopyWith<$Res> implements $ParishCopyWith<$Res> {
  factory _$ParishCopyWith(_Parish value, $Res Function(_Parish) _then) = __$ParishCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'diocese_id') int dioceseId,@JsonKey(name: 'parish_name') String parishName,@JsonKey(name: 'register_key') String registerKey,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$ParishCopyWithImpl<$Res>
    implements _$ParishCopyWith<$Res> {
  __$ParishCopyWithImpl(this._self, this._then);

  final _Parish _self;
  final $Res Function(_Parish) _then;

/// Create a copy of Parish
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dioceseId = null,Object? parishName = null,Object? registerKey = null,Object? createdAt = null,}) {
  return _then(_Parish(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,dioceseId: null == dioceseId ? _self.dioceseId : dioceseId // ignore: cast_nullable_to_non_nullable
as int,parishName: null == parishName ? _self.parishName : parishName // ignore: cast_nullable_to_non_nullable
as String,registerKey: null == registerKey ? _self.registerKey : registerKey // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
