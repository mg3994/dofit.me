// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'l10nr_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$L10nrEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is L10nrEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'L10nrEvent()';
}


}

/// @nodoc
class $L10nrEventCopyWith<$Res>  {
$L10nrEventCopyWith(L10nrEvent _, $Res Function(L10nrEvent) __);
}


/// @nodoc


class _GetLocale implements L10nrEvent {
  const _GetLocale();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLocale);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'L10nrEvent.getLocale()';
}


}




/// @nodoc


class _SetLocale implements L10nrEvent {
  const _SetLocale(this.l10nrEntity);
  

 final  L10nrEntity l10nrEntity;

/// Create a copy of L10nrEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLocaleCopyWith<_SetLocale> get copyWith => __$SetLocaleCopyWithImpl<_SetLocale>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLocale&&(identical(other.l10nrEntity, l10nrEntity) || other.l10nrEntity == l10nrEntity));
}


@override
int get hashCode => Object.hash(runtimeType,l10nrEntity);

@override
String toString() {
  return 'L10nrEvent.setLocale(l10nrEntity: $l10nrEntity)';
}


}

/// @nodoc
abstract mixin class _$SetLocaleCopyWith<$Res> implements $L10nrEventCopyWith<$Res> {
  factory _$SetLocaleCopyWith(_SetLocale value, $Res Function(_SetLocale) _then) = __$SetLocaleCopyWithImpl;
@useResult
$Res call({
 L10nrEntity l10nrEntity
});




}
/// @nodoc
class __$SetLocaleCopyWithImpl<$Res>
    implements _$SetLocaleCopyWith<$Res> {
  __$SetLocaleCopyWithImpl(this._self, this._then);

  final _SetLocale _self;
  final $Res Function(_SetLocale) _then;

/// Create a copy of L10nrEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? l10nrEntity = null,}) {
  return _then(_SetLocale(
null == l10nrEntity ? _self.l10nrEntity : l10nrEntity // ignore: cast_nullable_to_non_nullable
as L10nrEntity,
  ));
}


}

/// @nodoc
mixin _$L10nrState {

 L10nrEntity get l10nrEntity;
/// Create a copy of L10nrState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$L10nrStateCopyWith<L10nrState> get copyWith => _$L10nrStateCopyWithImpl<L10nrState>(this as L10nrState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is L10nrState&&(identical(other.l10nrEntity, l10nrEntity) || other.l10nrEntity == l10nrEntity));
}


@override
int get hashCode => Object.hash(runtimeType,l10nrEntity);

@override
String toString() {
  return 'L10nrState(l10nrEntity: $l10nrEntity)';
}


}

/// @nodoc
abstract mixin class $L10nrStateCopyWith<$Res>  {
  factory $L10nrStateCopyWith(L10nrState value, $Res Function(L10nrState) _then) = _$L10nrStateCopyWithImpl;
@useResult
$Res call({
 L10nrEntity l10nrEntity
});




}
/// @nodoc
class _$L10nrStateCopyWithImpl<$Res>
    implements $L10nrStateCopyWith<$Res> {
  _$L10nrStateCopyWithImpl(this._self, this._then);

  final L10nrState _self;
  final $Res Function(L10nrState) _then;

/// Create a copy of L10nrState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? l10nrEntity = null,}) {
  return _then(_self.copyWith(
l10nrEntity: null == l10nrEntity ? _self.l10nrEntity : l10nrEntity // ignore: cast_nullable_to_non_nullable
as L10nrEntity,
  ));
}

}


/// @nodoc


class _LocaleInitial extends L10nrState {
  const _LocaleInitial(this.l10nrEntity): super._();
  

@override final  L10nrEntity l10nrEntity;

/// Create a copy of L10nrState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleInitialCopyWith<_LocaleInitial> get copyWith => __$LocaleInitialCopyWithImpl<_LocaleInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleInitial&&(identical(other.l10nrEntity, l10nrEntity) || other.l10nrEntity == l10nrEntity));
}


@override
int get hashCode => Object.hash(runtimeType,l10nrEntity);

@override
String toString() {
  return 'L10nrState.initial(l10nrEntity: $l10nrEntity)';
}


}

/// @nodoc
abstract mixin class _$LocaleInitialCopyWith<$Res> implements $L10nrStateCopyWith<$Res> {
  factory _$LocaleInitialCopyWith(_LocaleInitial value, $Res Function(_LocaleInitial) _then) = __$LocaleInitialCopyWithImpl;
@override @useResult
$Res call({
 L10nrEntity l10nrEntity
});




}
/// @nodoc
class __$LocaleInitialCopyWithImpl<$Res>
    implements _$LocaleInitialCopyWith<$Res> {
  __$LocaleInitialCopyWithImpl(this._self, this._then);

  final _LocaleInitial _self;
  final $Res Function(_LocaleInitial) _then;

/// Create a copy of L10nrState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? l10nrEntity = null,}) {
  return _then(_LocaleInitial(
null == l10nrEntity ? _self.l10nrEntity : l10nrEntity // ignore: cast_nullable_to_non_nullable
as L10nrEntity,
  ));
}


}

/// @nodoc


class _LocaleLoaded extends L10nrState {
  const _LocaleLoaded(this.l10nrEntity): super._();
  

@override final  L10nrEntity l10nrEntity;

/// Create a copy of L10nrState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleLoadedCopyWith<_LocaleLoaded> get copyWith => __$LocaleLoadedCopyWithImpl<_LocaleLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleLoaded&&(identical(other.l10nrEntity, l10nrEntity) || other.l10nrEntity == l10nrEntity));
}


@override
int get hashCode => Object.hash(runtimeType,l10nrEntity);

@override
String toString() {
  return 'L10nrState.loaded(l10nrEntity: $l10nrEntity)';
}


}

/// @nodoc
abstract mixin class _$LocaleLoadedCopyWith<$Res> implements $L10nrStateCopyWith<$Res> {
  factory _$LocaleLoadedCopyWith(_LocaleLoaded value, $Res Function(_LocaleLoaded) _then) = __$LocaleLoadedCopyWithImpl;
@override @useResult
$Res call({
 L10nrEntity l10nrEntity
});




}
/// @nodoc
class __$LocaleLoadedCopyWithImpl<$Res>
    implements _$LocaleLoadedCopyWith<$Res> {
  __$LocaleLoadedCopyWithImpl(this._self, this._then);

  final _LocaleLoaded _self;
  final $Res Function(_LocaleLoaded) _then;

/// Create a copy of L10nrState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? l10nrEntity = null,}) {
  return _then(_LocaleLoaded(
null == l10nrEntity ? _self.l10nrEntity : l10nrEntity // ignore: cast_nullable_to_non_nullable
as L10nrEntity,
  ));
}


}

/// @nodoc


class _LocaleError extends L10nrState {
  const _LocaleError(this.message, this.l10nrEntity): super._();
  

 final  String message;
@override final  L10nrEntity l10nrEntity;

/// Create a copy of L10nrState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleErrorCopyWith<_LocaleError> get copyWith => __$LocaleErrorCopyWithImpl<_LocaleError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleError&&(identical(other.message, message) || other.message == message)&&(identical(other.l10nrEntity, l10nrEntity) || other.l10nrEntity == l10nrEntity));
}


@override
int get hashCode => Object.hash(runtimeType,message,l10nrEntity);

@override
String toString() {
  return 'L10nrState.error(message: $message, l10nrEntity: $l10nrEntity)';
}


}

/// @nodoc
abstract mixin class _$LocaleErrorCopyWith<$Res> implements $L10nrStateCopyWith<$Res> {
  factory _$LocaleErrorCopyWith(_LocaleError value, $Res Function(_LocaleError) _then) = __$LocaleErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, L10nrEntity l10nrEntity
});




}
/// @nodoc
class __$LocaleErrorCopyWithImpl<$Res>
    implements _$LocaleErrorCopyWith<$Res> {
  __$LocaleErrorCopyWithImpl(this._self, this._then);

  final _LocaleError _self;
  final $Res Function(_LocaleError) _then;

/// Create a copy of L10nrState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? l10nrEntity = null,}) {
  return _then(_LocaleError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,null == l10nrEntity ? _self.l10nrEntity : l10nrEntity // ignore: cast_nullable_to_non_nullable
as L10nrEntity,
  ));
}


}

// dart format on
