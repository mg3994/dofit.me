import 'package:flutter/material.dart';
import 'package:core/core.dart';

import 'package:thememoder/data/datasource/theme_mode_data_source.dart';
import 'package:thememoder/domain/entity/theme_mode_entity.dart';
final class ThemeModeLocalDataSource implements ThemeModeDataSource {
  final CacheStorage cacheStorage; // TODO: change to SharePreff or other as that gives bool
  const ThemeModeLocalDataSource({required this.cacheStorage});
  @override
  Future
  <bool>
   setThemeMode(ThemeModeEntity themeModeEntity) async{
     // Delete old (only one record needed)
    await cacheStorage.delete(cacheStorage.themeModeTable).go();
     final rowsAdded= await cacheStorage.into(cacheStorage.themeModeTable).insert(
      ThemeModeTableCompanion.insert(themeModeIndex: themeModeEntity.themeMode.index, ),
    );
    return rowsAdded >0;
    // await cacheStorage.write(key: "tm", value: themeModeEntity.themeMode.index
    // // 
    // .toString());

  }

  @override
  Future<ThemeModeEntity> getThemeMode()async {
     final record = await cacheStorage.select(cacheStorage.themeModeTable).getSingleOrNull();
    if (record == null) {
      return ThemeModeEntity(themeMode: ThemeMode.system); // Default
    }
    return ThemeModeEntity(themeMode: ThemeMode.values[record.themeModeIndex]);
//     var themeModeIndex = await cacheStorage.read(key: "tm");
// return  ThemeModeEntity(themeMode:ThemeMode.values[int.parse( themeModeIndex!)] );
  }
  
  @override
  Future<bool> resetThemeMode() async{
    final rowsDeleted = await cacheStorage.delete(cacheStorage.themeModeTable).go();
    return rowsDeleted > 0;
    // return await cacheStorage.delete(key: "tm");
  }
}