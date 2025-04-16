import 'package:core/core.dart';
import 'package:thememoder/domain/entity/theme_mode_entity.dart';
import 'package:thememoder/domain/repository/theme_mode_repository.dart';
final class SetThemeModeUseCase extends UseCase {
  final ThemeModeRepository thememodeRepository;
  const SetThemeModeUseCase({required this.thememodeRepository});
  call(ThemeModeEntity themeModeEntity)async{
    return await thememodeRepository.setThemeMode(themeModeEntity);
  }
}