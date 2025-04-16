import 'package:thememoder/data/datasource/theme_mode_datasource.dart' show ThemeModeDatasource;
import 'package:thememoder/domain/entity/theme_mode_entity.dart';
import 'package:thememoder/domain/repository/theme_mode_repository.dart' show ThemeModeRepository;

final class ThemeModeRepositoryImpl implements ThemeModeRepository {
  final ThemeModeDatasource themeModeDatasource;
  const ThemeModeRepositoryImpl({ required this.themeModeDatasource});

  @override
  Future<ThemeModeEntity> getThemeMode() async {
    return await themeModeDatasource.getThemeMode();
  }

  @override
  Future<void> setThemeMode(ThemeModeEntity themeModeEntity) async {
   return themeModeDatasource.savethemeMode(themeModeEntity);
  }
}