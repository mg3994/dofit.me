// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_mode_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeModeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeModeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeModeEvent()';
}


}

/// @nodoc
class $ThemeModeEventCopyWith<$Res>  {
$ThemeModeEventCopyWith(ThemeModeEvent _, $Res Function(ThemeModeEvent) __);
}


/// @nodoc


class _GetThemeMode implements ThemeModeEvent {
  const _GetThemeMode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetThemeMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeModeEvent.getCounter()';
}


}




/// @nodoc


class _ToggleThemeMode implements ThemeModeEvent {
  const _ToggleThemeMode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleThemeMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeModeEvent.toggleThemeMode()';
}


}




/// @nodoc


class _ResetThemeMode implements ThemeModeEvent {
  const _ResetThemeMode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetThemeMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeModeEvent.resetThemeMode()';
}


}




/// @nodoc
mixin _$ThemeModeState {

 ThemeModeEntity get themeModeEntity;
/// Create a copy of ThemeModeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeModeStateCopyWith<ThemeModeState> get copyWith => _$ThemeModeStateCopyWithImpl<ThemeModeState>(this as ThemeModeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeModeState&&(identical(other.themeModeEntity, themeModeEntity) || other.themeModeEntity == themeModeEntity));
}


@override
int get hashCode => Object.hash(runtimeType,themeModeEntity);

@override
String toString() {
  return 'ThemeModeState(themeModeEntity: $themeModeEntity)';
}


}

/// @nodoc
abstract mixin class $ThemeModeStateCopyWith<$Res>  {
  factory $ThemeModeStateCopyWith(ThemeModeState value, $Res Function(ThemeModeState) _then) = _$ThemeModeStateCopyWithImpl;
@useResult
$Res call({
 ThemeModeEntity themeModeEntity
});




}
/// @nodoc
class _$ThemeModeStateCopyWithImpl<$Res>
    implements $ThemeModeStateCopyWith<$Res> {
  _$ThemeModeStateCopyWithImpl(this._self, this._then);

  final ThemeModeState _self;
  final $Res Function(ThemeModeState) _then;

/// Create a copy of ThemeModeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeModeEntity = null,}) {
  return _then(_self.copyWith(
themeModeEntity: null == themeModeEntity ? _self.themeModeEntity : themeModeEntity // ignore: cast_nullable_to_non_nullable
as ThemeModeEntity,
  ));
}

}


/// @nodoc


class _ThemeModeInitial extends ThemeModeState {
  const _ThemeModeInitial(this.themeModeEntity): super._();
  

@override final  ThemeModeEntity themeModeEntity;

/// Create a copy of ThemeModeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeModeInitialCopyWith<_ThemeModeInitial> get copyWith => __$ThemeModeInitialCopyWithImpl<_ThemeModeInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeModeInitial&&(identical(other.themeModeEntity, themeModeEntity) || other.themeModeEntity == themeModeEntity));
}


@override
int get hashCode => Object.hash(runtimeType,themeModeEntity);

@override
String toString() {
  return 'ThemeModeState.initial(themeModeEntity: $themeModeEntity)';
}


}

/// @nodoc
abstract mixin class _$ThemeModeInitialCopyWith<$Res> implements $ThemeModeStateCopyWith<$Res> {
  factory _$ThemeModeInitialCopyWith(_ThemeModeInitial value, $Res Function(_ThemeModeInitial) _then) = __$ThemeModeInitialCopyWithImpl;
@override @useResult
$Res call({
 ThemeModeEntity themeModeEntity
});




}
/// @nodoc
class __$ThemeModeInitialCopyWithImpl<$Res>
    implements _$ThemeModeInitialCopyWith<$Res> {
  __$ThemeModeInitialCopyWithImpl(this._self, this._then);

  final _ThemeModeInitial _self;
  final $Res Function(_ThemeModeInitial) _then;

/// Create a copy of ThemeModeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeModeEntity = null,}) {
  return _then(_ThemeModeInitial(
null == themeModeEntity ? _self.themeModeEntity : themeModeEntity // ignore: cast_nullable_to_non_nullable
as ThemeModeEntity,
  ));
}


}

/// @nodoc


class _ThemeModeLoaded extends ThemeModeState {
  const _ThemeModeLoaded(this.themeModeEntity): super._();
  

@override final  ThemeModeEntity themeModeEntity;

/// Create a copy of ThemeModeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeModeLoadedCopyWith<_ThemeModeLoaded> get copyWith => __$ThemeModeLoadedCopyWithImpl<_ThemeModeLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeModeLoaded&&(identical(other.themeModeEntity, themeModeEntity) || other.themeModeEntity == themeModeEntity));
}


@override
int get hashCode => Object.hash(runtimeType,themeModeEntity);

@override
String toString() {
  return 'ThemeModeState.loaded(themeModeEntity: $themeModeEntity)';
}


}

/// @nodoc
abstract mixin class _$ThemeModeLoadedCopyWith<$Res> implements $ThemeModeStateCopyWith<$Res> {
  factory _$ThemeModeLoadedCopyWith(_ThemeModeLoaded value, $Res Function(_ThemeModeLoaded) _then) = __$ThemeModeLoadedCopyWithImpl;
@override @useResult
$Res call({
 ThemeModeEntity themeModeEntity
});




}
/// @nodoc
class __$ThemeModeLoadedCopyWithImpl<$Res>
    implements _$ThemeModeLoadedCopyWith<$Res> {
  __$ThemeModeLoadedCopyWithImpl(this._self, this._then);

  final _ThemeModeLoaded _self;
  final $Res Function(_ThemeModeLoaded) _then;

/// Create a copy of ThemeModeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeModeEntity = null,}) {
  return _then(_ThemeModeLoaded(
null == themeModeEntity ? _self.themeModeEntity : themeModeEntity // ignore: cast_nullable_to_non_nullable
as ThemeModeEntity,
  ));
}


}

/// @nodoc


class _ThemeModeError extends ThemeModeState {
  const _ThemeModeError(this.message, this.themeModeEntity): super._();
  

 final  String message;
@override final  ThemeModeEntity themeModeEntity;

/// Create a copy of ThemeModeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeModeErrorCopyWith<_ThemeModeError> get copyWith => __$ThemeModeErrorCopyWithImpl<_ThemeModeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeModeError&&(identical(other.message, message) || other.message == message)&&(identical(other.themeModeEntity, themeModeEntity) || other.themeModeEntity == themeModeEntity));
}


@override
int get hashCode => Object.hash(runtimeType,message,themeModeEntity);

@override
String toString() {
  return 'ThemeModeState.error(message: $message, themeModeEntity: $themeModeEntity)';
}


}

/// @nodoc
abstract mixin class _$ThemeModeErrorCopyWith<$Res> implements $ThemeModeStateCopyWith<$Res> {
  factory _$ThemeModeErrorCopyWith(_ThemeModeError value, $Res Function(_ThemeModeError) _then) = __$ThemeModeErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, ThemeModeEntity themeModeEntity
});




}
/// @nodoc
class __$ThemeModeErrorCopyWithImpl<$Res>
    implements _$ThemeModeErrorCopyWith<$Res> {
  __$ThemeModeErrorCopyWithImpl(this._self, this._then);

  final _ThemeModeError _self;
  final $Res Function(_ThemeModeError) _then;

/// Create a copy of ThemeModeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? themeModeEntity = null,}) {
  return _then(_ThemeModeError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,null == themeModeEntity ? _self.themeModeEntity : themeModeEntity // ignore: cast_nullable_to_non_nullable
as ThemeModeEntity,
  ));
}


}

// dart format on
