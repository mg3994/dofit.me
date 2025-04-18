// import 'package:thememoder/domain/entity/theme_mode_entity.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:thememoder/domain/usecase/get_theme_mode_use_case.dart';
// import 'package:thememoder/domain/usecase/set_theme_mode_use_case.dart';


// part 'theme_mode_event.dart';
// part 'theme_mode_state.dart';
// part 'theme_mode_bloc.freezed.dart';

// class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
//   final GetThemeModeUseCase getThemeModeUseCase;
//   final SetThemeModeUseCase setThemeModeUseCase;
 

//   ThemeModeBloc(this.getThemeModeUseCase, this.setThemeModeUseCase,
//      )
//       : super(const _ThemeModeInitial(ThemeModeEntity())) {
//     on<ThemeModeEvent>((event, emit) async {
//       await event.when(
//         getThemeMode: () async {
//           try {
//             final themeMode = await getThemeModeUseCase();

//             emit(_ThemeModeLoaded(counter));
//           } catch (e) {
//             emit(const _CounterError(
//                 "Error Loading Counter", CounterEntity(value: 0)));
//           }

//           // emit(state);
//         },
//         setThemeMode: () async {
//           // final currentValue = state.counter.value;
//           // emit(CounterState.loaded(CounterEntity(value: currentValue + 1)));
//           try {
//             final counter = await incrementCounterUseCase();
//             emit(_CounterLoaded(counter));
//           } catch (e) {
//             emit(const _CounterError(
//                 "Error Loading Counter", CounterEntity(value: 0)));
//           }
//         },
//         // decrementCounter: () async {
//         //   try {
//         //     final counter = await decrementCounterUseCase.execute();
//         //     emit(_CounterLoaded(counter));
//         //   } catch (e) {
//         //     emit(const _CounterError(
//         //         "Error Loading Counter", CounterEntity(value: 0)));
//         //   }

//         //   // final currentValue = state.counter.value;
//         //   // if (currentValue > 0) {
//         //   //   emit(CounterState.loaded(CounterEntity(value: currentValue - 1)));
//         //   // } else {
//         //   //   emit(const CounterState.error(
//         //   //       'Cannot decrement below 0', CounterEntity(value: 0)));
//         //   // }
//         // },
//       );
//     });
//   }
// }
/////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:thememoder/domain/entity/theme_mode_entity.dart';

import 'package:core/core.dart';
import 'package:thememoder/domain/usecase/get_theme_mode_use_case.dart';
import 'package:thememoder/domain/usecase/reset_theme_mode_use_case.dart';
import 'package:thememoder/domain/usecase/set_theme_mode_use_case.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';
part 'theme_mode_bloc.freezed.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  final GetThemeModeUseCase getThemeModeUseCase;
  final SetThemeModeUseCase setThemeModeUseCase;
  final ResetThemeModeUseCase resetThemeModeUseCase;

  ThemeModeBloc({
    required this.getThemeModeUseCase,
    required this.setThemeModeUseCase,
    required this.resetThemeModeUseCase,
  }) : super(const _ThemeModeInitial(ThemeModeEntity(themeMode: ThemeMode.system))) {
    on<_GetThemeMode>(_onGetThemeMode);
    on<_ToggleThemeMode>(_onToggleThemeMode);
    on<_ResetThemeMode>(_onResetThemeMode);
  }

  Future<void> _onGetThemeMode(
    _GetThemeMode event,
    Emitter<ThemeModeState> emit,
  ) async {
    final result = await getThemeModeUseCase(NoParams());
    result.fold(
      (failure) => emit(ThemeModeState.error(failure.message, state.themeModeEntity)),
      (themeModeEntity) => emit(ThemeModeState.loaded(themeModeEntity)),
    );
  }

  Future<void> _onToggleThemeMode(
    _ToggleThemeMode event,
    Emitter<ThemeModeState> emit,
  ) async {
    final currentMode = state.themeModeEntity.themeMode;

  final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  final resolvedMode = currentMode == ThemeMode.system
      ? (brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light)
      : currentMode; // notify using snackbar when switching from ThemeMode.system to any other

  final newMode = resolvedMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    // final currentMode = state.themeModeEntity.themeMode;
    // final newMode = currentMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark; // do include system

    final result = await setThemeModeUseCase(
      ThemeModeEntity(themeMode: newMode),
    );

    result.fold(
      (failure) => emit(ThemeModeState.error(failure.message, state.themeModeEntity)),
      (_) => emit(ThemeModeState.loaded(ThemeModeEntity(themeMode: newMode))),
    );
  }

  Future<void> _onResetThemeMode(
    _ResetThemeMode event,
    Emitter<ThemeModeState> emit,
  ) async {
    final result = await resetThemeModeUseCase(
      NoParams()
      // ThemeModeEntity(themeMode: ThemeMode.system), // not used in deletion, but sent per signature
    );

    result.fold(
      (failure) => emit(ThemeModeState.error(failure.message, state.themeModeEntity)),
      (_) => emit(const ThemeModeState.loaded(ThemeModeEntity(themeMode: ThemeMode.system))),
    );
  }
}
