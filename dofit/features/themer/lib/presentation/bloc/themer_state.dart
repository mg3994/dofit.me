part of 'themer_bloc.dart';



@freezed
sealed class ThemerState with _$ThemerState {
  const ThemerState._();
  //
  const factory ThemerState.initial(ThemerEntity themerEntity) =_ThemerInitial;
  const factory ThemerState.loaded(ThemerEntity themerEntity) = _ThemerLoaded;
  const factory ThemerState.error(String message, ThemerEntity themerEntity)= _ThemerError;
}