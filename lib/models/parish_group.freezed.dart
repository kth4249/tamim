// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parish_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParishGroup {

 int get id; int get parishId; int get categoryId; String get groupName; String get description; String get joinKey; String get status; String get createdBy; DateTime get createdAt; String get updatedBy; DateTime get updatedAt;
/// Create a copy of ParishGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParishGroupCopyWith<ParishGroup> get copyWith => _$ParishGroupCopyWithImpl<ParishGroup>(this as ParishGroup, _$identity);

  /// Serializes this ParishGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParishGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.parishId, parishId) || other.parishId == parishId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.description, description) || other.description == description)&&(identical(other.joinKey, joinKey) || other.joinKey == joinKey)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,parishId,categoryId,groupName,description,joinKey,status,createdBy,createdAt,updatedBy,updatedAt);

@override
String toString() {
  return 'ParishGroup(id: $id, parishId: $parishId, categoryId: $categoryId, groupName: $groupName, description: $description, joinKey: $joinKey, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedBy: $updatedBy, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ParishGroupCopyWith<$Res>  {
  factory $ParishGroupCopyWith(ParishGroup value, $Res Function(ParishGroup) _then) = _$ParishGroupCopyWithImpl;
@useResult
$Res call({
 int id, int parishId, int categoryId, String groupName, String description, String joinKey, String status, String createdBy, DateTime createdAt, String updatedBy, DateTime updatedAt
});




}
/// @nodoc
class _$ParishGroupCopyWithImpl<$Res>
    implements $ParishGroupCopyWith<$Res> {
  _$ParishGroupCopyWithImpl(this._self, this._then);

  final ParishGroup _self;
  final $Res Function(ParishGroup) _then;

/// Create a copy of ParishGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? parishId = null,Object? categoryId = null,Object? groupName = null,Object? description = null,Object? joinKey = null,Object? status = null,Object? createdBy = null,Object? createdAt = null,Object? updatedBy = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,parishId: null == parishId ? _self.parishId : parishId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,joinKey: null == joinKey ? _self.joinKey : joinKey // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ParishGroup implements ParishGroup {
  const _ParishGroup({required this.id, required this.parishId, required this.categoryId, required this.groupName, required this.description, required this.joinKey, required this.status, required this.createdBy, required this.createdAt, required this.updatedBy, required this.updatedAt});
  factory _ParishGroup.fromJson(Map<String, dynamic> json) => _$ParishGroupFromJson(json);

@override final  int id;
@override final  int parishId;
@override final  int categoryId;
@override final  String groupName;
@override final  String description;
@override final  String joinKey;
@override final  String status;
@override final  String createdBy;
@override final  DateTime createdAt;
@override final  String updatedBy;
@override final  DateTime updatedAt;

/// Create a copy of ParishGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParishGroupCopyWith<_ParishGroup> get copyWith => __$ParishGroupCopyWithImpl<_ParishGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParishGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParishGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.parishId, parishId) || other.parishId == parishId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.groupName, groupName) || other.groupName == groupName)&&(identical(other.description, description) || other.description == description)&&(identical(other.joinKey, joinKey) || other.joinKey == joinKey)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,parishId,categoryId,groupName,description,joinKey,status,createdBy,createdAt,updatedBy,updatedAt);

@override
String toString() {
  return 'ParishGroup(id: $id, parishId: $parishId, categoryId: $categoryId, groupName: $groupName, description: $description, joinKey: $joinKey, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedBy: $updatedBy, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ParishGroupCopyWith<$Res> implements $ParishGroupCopyWith<$Res> {
  factory _$ParishGroupCopyWith(_ParishGroup value, $Res Function(_ParishGroup) _then) = __$ParishGroupCopyWithImpl;
@override @useResult
$Res call({
 int id, int parishId, int categoryId, String groupName, String description, String joinKey, String status, String createdBy, DateTime createdAt, String updatedBy, DateTime updatedAt
});




}
/// @nodoc
class __$ParishGroupCopyWithImpl<$Res>
    implements _$ParishGroupCopyWith<$Res> {
  __$ParishGroupCopyWithImpl(this._self, this._then);

  final _ParishGroup _self;
  final $Res Function(_ParishGroup) _then;

/// Create a copy of ParishGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? parishId = null,Object? categoryId = null,Object? groupName = null,Object? description = null,Object? joinKey = null,Object? status = null,Object? createdBy = null,Object? createdAt = null,Object? updatedBy = null,Object? updatedAt = null,}) {
  return _then(_ParishGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,parishId: null == parishId ? _self.parishId : parishId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,groupName: null == groupName ? _self.groupName : groupName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,joinKey: null == joinKey ? _self.joinKey : joinKey // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedBy: null == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
