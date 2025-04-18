// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'themer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemerEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemerEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemerEvent()';
}


}

/// @nodoc
class $ThemerEventCopyWith<$Res>  {
$ThemerEventCopyWith(ThemerEvent _, $Res Function(ThemerEvent) __);
}


/// @nodoc


class _GetThemer implements ThemerEvent {
  const _GetThemer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetThemer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemerEvent.getThemer()';
}


}




/// @nodoc


class _SetThemer implements ThemerEvent {
  const _SetThemer(this.themerEntity);
  

 final  ThemerEntity themerEntity;

/// Create a copy of ThemerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetThemerCopyWith<_SetThemer> get copyWith => __$SetThemerCopyWithImpl<_SetThemer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetThemer&&(identical(other.themerEntity, themerEntity) || other.themerEntity == themerEntity));
}


@override
int get hashCode => Object.hash(runtimeType,themerEntity);

@override
String toString() {
  return 'ThemerEvent.setThemer(themerEntity: $themerEntity)';
}


}

/// @nodoc
abstract mixin class _$SetThemerCopyWith<$Res> implements $ThemerEventCopyWith<$Res> {
  factory _$SetThemerCopyWith(_SetThemer value, $Res Function(_SetThemer) _then) = __$SetThemerCopyWithImpl;
@useResult
$Res call({
 ThemerEntity themerEntity
});




}
/// @nodoc
class __$SetThemerCopyWithImpl<$Res>
    implements _$SetThemerCopyWith<$Res> {
  __$SetThemerCopyWithImpl(this._self, this._then);

  final _SetThemer _self;
  final $Res Function(_SetThemer) _then;

/// Create a copy of ThemerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? themerEntity = null,}) {
  return _then(_SetThemer(
null == themerEntity ? _self.themerEntity : themerEntity // ignore: cast_nullable_to_non_nullable
as ThemerEntity,
  ));
}


}

/// @nodoc
mixin _$ThemerState {

 ThemerEntity get themerEntity;
/// Create a copy of ThemerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemerStateCopyWith<ThemerState> get copyWith => _$ThemerStateCopyWithImpl<ThemerState>(this as ThemerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemerState&&(identical(other.themerEntity, themerEntity) || other.themerEntity == themerEntity));
}


@override
int get hashCode => Object.hash(runtimeType,themerEntity);

@override
String toString() {
  return 'ThemerState(themerEntity: $themerEntity)';
}


}

/// @nodoc
abstract mixin class $ThemerStateCopyWith<$Res>  {
  factory $ThemerStateCopyWith(ThemerState value, $Res Function(ThemerState) _then) = _$ThemerStateCopyWithImpl;
@useResult
$Res call({
 ThemerEntity themerEntity
});




}
/// @nodoc
class _$ThemerStateCopyWithImpl<$Res>
    implements $ThemerStateCopyWith<$Res> {
  _$ThemerStateCopyWithImpl(this._self, this._then);

  final ThemerState _self;
  final $Res Function(ThemerState) _then;

/// Create a copy of ThemerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themerEntity = null,}) {
  return _then(_self.copyWith(
themerEntity: null == themerEntity ? _self.themerEntity : themerEntity // ignore: cast_nullable_to_non_nullable
as ThemerEntity,
  ));
}

}


/// @nodoc


class _ThemerInitial extends ThemerState {
  const _ThemerInitial(this.themerEntity): super._();
  

@override final  ThemerEntity themerEntity;

/// Create a copy of ThemerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemerInitialCopyWith<_ThemerInitial> get copyWith => __$ThemerInitialCopyWithImpl<_ThemerInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemerInitial&&(identical(other.themerEntity, themerEntity) || other.themerEntity == themerEntity));
}


@override
int get hashCode => Object.hash(runtimeType,themerEntity);

@override
String toString() {
  return 'ThemerState.initial(themerEntity: $themerEntity)';
}


}

/// @nodoc
abstract mixin class _$ThemerInitialCopyWith<$Res> implements $ThemerStateCopyWith<$Res> {
  factory _$ThemerInitialCopyWith(_ThemerInitial value, $Res Function(_ThemerInitial) _then) = __$ThemerInitialCopyWithImpl;
@override @useResult
$Res call({
 ThemerEntity themerEntity
});




}
/// @nodoc
class __$ThemerInitialCopyWithImpl<$Res>
    implements _$ThemerInitialCopyWith<$Res> {
  __$ThemerInitialCopyWithImpl(this._self, this._then);

  final _ThemerInitial _self;
  final $Res Function(_ThemerInitial) _then;

/// Create a copy of ThemerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themerEntity = null,}) {
  return _then(_ThemerInitial(
null == themerEntity ? _self.themerEntity : themerEntity // ignore: cast_nullable_to_non_nullable
as ThemerEntity,
  ));
}


}

/// @nodoc


class _ThemerLoaded extends ThemerState {
  const _ThemerLoaded(this.themerEntity): super._();
  

@override final  ThemerEntity themerEntity;

/// Create a copy of ThemerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemerLoadedCopyWith<_ThemerLoaded> get copyWith => __$ThemerLoadedCopyWithImpl<_ThemerLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemerLoaded&&(identical(other.themerEntity, themerEntity) || other.themerEntity == themerEntity));
}


@override
int get hashCode => Object.hash(runtimeType,themerEntity);

@override
String toString() {
  return 'ThemerState.loaded(themerEntity: $themerEntity)';
}


}

/// @nodoc
abstract mixin class _$ThemerLoadedCopyWith<$Res> implements $ThemerStateCopyWith<$Res> {
  factory _$ThemerLoadedCopyWith(_ThemerLoaded value, $Res Function(_ThemerLoaded) _then) = __$ThemerLoadedCopyWithImpl;
@override @useResult
$Res call({
 ThemerEntity themerEntity
});




}
/// @nodoc
class __$ThemerLoadedCopyWithImpl<$Res>
    implements _$ThemerLoadedCopyWith<$Res> {
  __$ThemerLoadedCopyWithImpl(this._self, this._then);

  final _ThemerLoaded _self;
  final $Res Function(_ThemerLoaded) _then;

/// Create a copy of ThemerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themerEntity = null,}) {
  return _then(_ThemerLoaded(
null == themerEntity ? _self.themerEntity : themerEntity // ignore: cast_nullable_to_non_nullable
as ThemerEntity,
  ));
}


}

/// @nodoc


class _ThemerError extends ThemerState {
  const _ThemerError(this.message, this.themerEntity): super._();
  

 final  String message;
@override final  ThemerEntity themerEntity;

/// Create a copy of ThemerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemerErrorCopyWith<_ThemerError> get copyWith => __$ThemerErrorCopyWithImpl<_ThemerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemerError&&(identical(other.message, message) || other.message == message)&&(identical(other.themerEntity, themerEntity) || other.themerEntity == themerEntity));
}


@override
int get hashCode => Object.hash(runtimeType,message,themerEntity);

@override
String toString() {
  return 'ThemerState.error(message: $message, themerEntity: $themerEntity)';
}


}

/// @nodoc
abstract mixin class _$ThemerErrorCopyWith<$Res> implements $ThemerStateCopyWith<$Res> {
  factory _$ThemerErrorCopyWith(_ThemerError value, $Res Function(_ThemerError) _then) = __$ThemerErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, ThemerEntity themerEntity
});




}
/// @nodoc
class __$ThemerErrorCopyWithImpl<$Res>
    implements _$ThemerErrorCopyWith<$Res> {
  __$ThemerErrorCopyWithImpl(this._self, this._then);

  final _ThemerError _self;
  final $Res Function(_ThemerError) _then;

/// Create a copy of ThemerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? themerEntity = null,}) {
  return _then(_ThemerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,null == themerEntity ? _self.themerEntity : themerEntity // ignore: cast_nullable_to_non_nullable
as ThemerEntity,
  ));
}


}

// dart format on
