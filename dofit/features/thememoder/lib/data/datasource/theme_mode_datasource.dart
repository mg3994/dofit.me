import 'package:thememoder/domain/entity/theme_mode_entity.dart';
abstract interface class ThemeModeDatasource {
  const ThemeModeDatasource();
    Future<void> savethemeMode(ThemeModeEntity themeModeEntity);
    Future<ThemeModeEntity> getThemeMode();
}