import 'package:flutter/material.dart';
import 'package:thememoder/data/datasource/theme_mode_datasource.dart' show ThemeModeDatasource;
import 'package:thememoder/domain/entity/theme_mode_entity.dart';

final class ThemeModeLocalDatasource implements ThemeModeDatasource {
  const ThemeModeLocalDatasource({required this.cacheManager});
  final CacheManager cacheManager;
  @override
  Future<void> savethemeMode(ThemeModeEntity themeModeEntity)async {
    //TODO: avoid if same Theme
    var themeModeIndex = themeModeEntity.themeMode.index;
    await cacheManager.savethemeModeIndex(themeModeIndex);
  }
  @override
  Future<ThemeModeEntity> getThemeMode() async {
    var themeModeIndex = cacheManager.getThemeModeIndex();
    // If Null or nullable then System
    return ThemeModeEntity(themeMode: (themeModeIndex != null) ? ThemeMode.values[themeModeIndex] : ThemeMode.system) ;
  }
}
