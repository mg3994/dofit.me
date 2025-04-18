import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:l10nr/domain/entities/l10nr_entity.dart';
import 'package:l10nr/domain/usecases/l10nr_use_case.dart';

part 'l10nr_event.dart';
part 'l10nr_state.dart';
part 'l10nr_bloc.freezed.dart';

class L10nrBloc extends Bloc<L10nrEvent, L10nrState> {
final GetL10nrUseCase getL10nrUseCase;
final SetL10nrUseCase setL10nrUseCase;

  L10nrBloc({
   required  this.getL10nrUseCase,
   required  this.setL10nrUseCase}) : super( const _LocaleInitial(L10nrEntity(locale:  Locale.fromSubtags(languageCode: 'en'),))) {
    on<_GetLocale>(_onGetLocale);
    on<_SetLocale>(_onSetLocale);

  }

  FutureOr<void> _onGetLocale(_GetLocale event, Emitter<L10nrState> emit) async{
    final result = await getL10nrUseCase(NoParams());
    result.fold((failure) => emit(L10nrState.error(failure.message, state.l10nrEntity)),
     (l10nrEntity)=>emit(L10nrState.loaded(l10nrEntity)));
  }

  FutureOr<void> _onSetLocale(_SetLocale event, Emitter<L10nrState> emit) async {
    final result = await setL10nrUseCase(event.l10nrEntity);
    result.fold(
      (failure) => emit(L10nrState.error(failure.message, state.l10nrEntity)),
      (_) => emit(L10nrState.loaded(event.l10nrEntity)),
    );
  }
}
