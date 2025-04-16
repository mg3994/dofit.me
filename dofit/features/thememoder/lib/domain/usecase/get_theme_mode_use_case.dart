import 'package:core/core.dart';
import 'package:thememoder/domain/repository/theme_mode_repository.dart';
final class GetThemeModeUseCase extends UseCase {
  final ThemeModeRepository themeRepository;
  const GetThemeModeUseCase({required this.themeRepository});
  call()async{
    return await themeRepository.getThemeMode();
  }
}