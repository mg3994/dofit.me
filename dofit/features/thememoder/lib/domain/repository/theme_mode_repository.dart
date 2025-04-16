import 'package:thememoder/domain/entity/theme_mode_entity.dart';

abstract class ThemeModeRepository {
  const ThemeModeRepository();
  Future<ThemeModeEntity> getThemeMode();
  Future<void> setThemeMode(ThemeModeEntity themeModeEntity);
}