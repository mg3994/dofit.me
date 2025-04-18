import 'dart:async';

import 'package:core/core.dart';

import 'package:themer/domain/entities/themer_entity.dart';

import '../../domain/usecases/themer_usecase.dart';

part 'themer_event.dart';
part 'themer_state.dart';
part 'themer_bloc.freezed.dart';

class ThemerBloc extends Bloc<ThemerEvent, ThemerState> {
  final GetThemerUseCase getThemerUseCase;
  final SetThemerUseCase setThemerUseCase;

  ThemerBloc({required this.getThemerUseCase, required this.setThemerUseCase})
    : super(
        const _ThemerInitial(ThemerEntity(flexScheme: FlexScheme.material)),
      ) {
    on<_GetThemer>(_onGetThemer);
    on<_SetThemer>(_onSetThemer);
  }
  FutureOr<void> _onGetThemer(
    _GetThemer event,
    Emitter<ThemerState> emit,
  ) async {
    final result = await getThemerUseCase(NoParams());
    result.fold(
      (failure) => emit(ThemerState.error(failure.message, state.themerEntity)),
      (themerEntity) => emit(ThemerState.loaded(themerEntity)),
    );
  }

  FutureOr<void> _onSetThemer(
    _SetThemer event,
    Emitter<ThemerState> emit,
  ) async {
    final result = await setThemerUseCase(event.themerEntity);
    result.fold(
      (failure) => emit(ThemerState.error(failure.message, state.themerEntity)),
      (_) => emit(ThemerState.loaded(event.themerEntity)),
    );
  }
}
