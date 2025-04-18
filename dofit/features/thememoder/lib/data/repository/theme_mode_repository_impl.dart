import 'package:thememoder/data/datasource/theme_mode_data_source.dart';
import 'package:thememoder/data/datasource/theme_mode_local_data_source.dart';
import 'package:thememoder/domain/entity/theme_mode_entity.dart';
import 'package:thememoder/domain/repository/theme_mode_repository.dart';

final class ThemeModeRepositoryImpl implements ThemeModeRepository{
  const ThemeModeRepositoryImpl(this.themeModeDataSource);
final ThemeModeDataSource themeModeDataSource;
  @override
  Future<ThemeModeEntity> getThemeMode() async {
  return await themeModeDataSource.getThemeMode();
  }

  @override
  Future<bool> setThemeMode(ThemeModeEntity themeModeEntity) async{
   return await themeModeDataSource.setThemeMode(themeModeEntity);
  }
  
  @override
  Future<bool> resetThemeMode() async{
   return await themeModeDataSource.resetThemeMode();
    
  }
}