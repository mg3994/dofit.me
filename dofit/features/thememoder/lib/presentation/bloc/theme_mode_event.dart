part of 'theme_mode_bloc.dart';

@freezed
sealed class ThemeModeEvent with _$ThemeModeEvent {
  const factory ThemeModeEvent.getThemeMode() = _GetThemeMode;
  const factory ThemeModeEvent.toggleThemeMode() = _ToggleThemeMode;
  const factory ThemeModeEvent.resetThemeMode() = _ResetThemeMode;
 
}
