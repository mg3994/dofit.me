import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:thememoder/domain/entity/theme_mode_entity.dart';
abstract interface class ThemeModeDataSource {
  // TODO: change to SharePreff or other as that gives bool
  const ThemeModeDataSource();
  Future
  <bool>
   setThemeMode(ThemeModeEntity themeModeEntity);

  Future<ThemeModeEntity> getThemeMode();
  Future<bool> resetThemeMode();
}