import 'package:thememoder/domain/entity/theme_mode_entity.dart';

abstract interface class ThemeModeRepository {
  const ThemeModeRepository();
  Future<ThemeModeEntity> getThemeMode();
  Future<bool> setThemeMode(ThemeModeEntity themeModeEntity);
   Future<bool> resetThemeMode();
}