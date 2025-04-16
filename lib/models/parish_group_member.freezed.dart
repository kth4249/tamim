// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parish_group_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParishGroupMember {

 int get id; int get groupId; String get userId; int get roleId; String get status; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ParishGroupMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParishGroupMemberCopyWith<ParishGroupMember> get copyWith => _$ParishGroupMemberCopyWithImpl<ParishGroupMember>(this as ParishGroupMember, _$identity);

  /// Serializes this ParishGroupMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParishGroupMember&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,userId,roleId,status,createdAt,updatedAt);

@override
String toString() {
  return 'ParishGroupMember(id: $id, groupId: $groupId, userId: $userId, roleId: $roleId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ParishGroupMemberCopyWith<$Res>  {
  factory $ParishGroupMemberCopyWith(ParishGroupMember value, $Res Function(ParishGroupMember) _then) = _$ParishGroupMemberCopyWithImpl;
@useResult
$Res call({
 int id, int groupId, String userId, int roleId, String status, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ParishGroupMemberCopyWithImpl<$Res>
    implements $ParishGroupMemberCopyWith<$Res> {
  _$ParishGroupMemberCopyWithImpl(this._self, this._then);

  final ParishGroupMember _self;
  final $Res Function(ParishGroupMember) _then;

/// Create a copy of ParishGroupMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? groupId = null,Object? userId = null,Object? roleId = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,roleId: null == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ParishGroupMember implements ParishGroupMember {
  const _ParishGroupMember({required this.id, required this.groupId, required this.userId, required this.roleId, required this.status, required this.createdAt, required this.updatedAt});
  factory _ParishGroupMember.fromJson(Map<String, dynamic> json) => _$ParishGroupMemberFromJson(json);

@override final  int id;
@override final  int groupId;
@override final  String userId;
@override final  int roleId;
@override final  String status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ParishGroupMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParishGroupMemberCopyWith<_ParishGroupMember> get copyWith => __$ParishGroupMemberCopyWithImpl<_ParishGroupMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParishGroupMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParishGroupMember&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,userId,roleId,status,createdAt,updatedAt);

@override
String toString() {
  return 'ParishGroupMember(id: $id, groupId: $groupId, userId: $userId, roleId: $roleId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ParishGroupMemberCopyWith<$Res> implements $ParishGroupMemberCopyWith<$Res> {
  factory _$ParishGroupMemberCopyWith(_ParishGroupMember value, $Res Function(_ParishGroupMember) _then) = __$ParishGroupMemberCopyWithImpl;
@override @useResult
$Res call({
 int id, int groupId, String userId, int roleId, String status, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ParishGroupMemberCopyWithImpl<$Res>
    implements _$ParishGroupMemberCopyWith<$Res> {
  __$ParishGroupMemberCopyWithImpl(this._self, this._then);

  final _ParishGroupMember _self;
  final $Res Function(_ParishGroupMember) _then;

/// Create a copy of ParishGroupMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? groupId = null,Object? userId = null,Object? roleId = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ParishGroupMember(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,roleId: null == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
