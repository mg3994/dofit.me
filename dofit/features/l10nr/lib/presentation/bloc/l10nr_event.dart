part of 'l10nr_bloc.dart';

@freezed
sealed class L10nrEvent with _$L10nrEvent {
  const factory L10nrEvent.getLocale() = _GetLocale;
  const factory L10nrEvent.setLocale(L10nrEntity l10nrEntity ) = _SetLocale;
}
