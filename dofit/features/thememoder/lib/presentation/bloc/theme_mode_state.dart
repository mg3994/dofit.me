part of 'theme_mode_bloc.dart';

@freezed
sealed class ThemeModeState with _$ThemeModeState {
  const ThemeModeState._(); // Private constructor for shared methods
  //
  const factory ThemeModeState.initial(ThemeModeEntity themeModeEntity) = _ThemeModeInitial;
  const factory ThemeModeState.loaded( ThemeModeEntity themeModeEntity) = _ThemeModeLoaded;
  const factory ThemeModeState.error(String message,  ThemeModeEntity themeModeEntity) =
      _ThemeModeError;


}
