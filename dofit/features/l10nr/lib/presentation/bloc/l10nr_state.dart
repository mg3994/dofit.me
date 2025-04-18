part of 'l10nr_bloc.dart';

@freezed
sealed class L10nrState with _$L10nrState {
  const L10nrState._();
const factory L10nrState.initial(L10nrEntity l10nrEntity) =_LocaleInitial;
const factory L10nrState.loaded(L10nrEntity l10nrEntity) = _LocaleLoaded;
const factory L10nrState.error(String message,L10nrEntity l10nrEntity)= _LocaleError;

}

