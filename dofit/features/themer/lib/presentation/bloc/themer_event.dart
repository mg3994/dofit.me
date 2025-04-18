part of 'themer_bloc.dart';
@freezed
sealed class ThemerEvent with _$ThemerEvent{
  const factory ThemerEvent.getThemer() = _GetThemer;
  const factory ThemerEvent.setThemer(ThemerEntity themerEntity) = _SetThemer;

}