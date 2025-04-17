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

 String get id; String get positionId; String get positionName; String get userId; String get name; String get baptismalName;
/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolunteerEventCopyWith<VolunteerEvent> get copyWith => _$VolunteerEventCopyWithImpl<VolunteerEvent>(this as VolunteerEvent, _$identity);

  /// Serializes this VolunteerEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolunteerEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.positionId, positionId) || other.positionId == positionId)&&(identical(other.positionName, positionName) || other.positionName == positionName)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.baptismalName, baptismalName) || other.baptismalName == baptismalName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,positionId,positionName,userId,name,baptismalName);

@override
String toString() {
  return 'VolunteerEvent(id: $id, positionId: $positionId, positionName: $positionName, userId: $userId, name: $name, baptismalName: $baptismalName)';
}


}

/// @nodoc
abstract mixin class $VolunteerEventCopyWith<$Res>  {
  factory $VolunteerEventCopyWith(VolunteerEvent value, $Res Function(VolunteerEvent) _then) = _$VolunteerEventCopyWithImpl;
@useResult
$Res call({
 String id, String positionId, String positionName, String userId, String name, String baptismalName
});




}
/// @nodoc
class _$VolunteerEventCopyWithImpl<$Res>
    implements $VolunteerEventCopyWith<$Res> {
  _$VolunteerEventCopyWithImpl(this._self, this._then);

  final VolunteerEvent _self;
  final $Res Function(VolunteerEvent) _then;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? positionId = null,Object? positionName = null,Object? userId = null,Object? name = null,Object? baptismalName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,positionId: null == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as String,positionName: null == positionName ? _self.positionName : positionName // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,baptismalName: null == baptismalName ? _self.baptismalName : baptismalName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VolunteerEvent implements VolunteerEvent {
  const _VolunteerEvent({required this.id, required this.positionId, required this.positionName, required this.userId, required this.name, required this.baptismalName});
  factory _VolunteerEvent.fromJson(Map<String, dynamic> json) => _$VolunteerEventFromJson(json);

@override final  String id;
@override final  String positionId;
@override final  String positionName;
@override final  String userId;
@override final  String name;
@override final  String baptismalName;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolunteerEventCopyWith<_VolunteerEvent> get copyWith => __$VolunteerEventCopyWithImpl<_VolunteerEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolunteerEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolunteerEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.positionId, positionId) || other.positionId == positionId)&&(identical(other.positionName, positionName) || other.positionName == positionName)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.baptismalName, baptismalName) || other.baptismalName == baptismalName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,positionId,positionName,userId,name,baptismalName);

@override
String toString() {
  return 'VolunteerEvent(id: $id, positionId: $positionId, positionName: $positionName, userId: $userId, name: $name, baptismalName: $baptismalName)';
}


}

/// @nodoc
abstract mixin class _$VolunteerEventCopyWith<$Res> implements $VolunteerEventCopyWith<$Res> {
  factory _$VolunteerEventCopyWith(_VolunteerEvent value, $Res Function(_VolunteerEvent) _then) = __$VolunteerEventCopyWithImpl;
@override @useResult
$Res call({
 String id, String positionId, String positionName, String userId, String name, String baptismalName
});




}
/// @nodoc
class __$VolunteerEventCopyWithImpl<$Res>
    implements _$VolunteerEventCopyWith<$Res> {
  __$VolunteerEventCopyWithImpl(this._self, this._then);

  final _VolunteerEvent _self;
  final $Res Function(_VolunteerEvent) _then;

/// Create a copy of VolunteerEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? positionId = null,Object? positionName = null,Object? userId = null,Object? name = null,Object? baptismalName = null,}) {
  return _then(_VolunteerEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,positionId: null == positionId ? _self.positionId : positionId // ignore: cast_nullable_to_non_nullable
as String,positionName: null == positionName ? _self.positionName : positionName // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,baptismalName: null == baptismalName ? _self.baptismalName : baptismalName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
