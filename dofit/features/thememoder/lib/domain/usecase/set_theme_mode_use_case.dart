import 'package:core/core.dart';

import 'package:thememoder/domain/entity/theme_mode_entity.dart';
import 'package:thememoder/domain/repository/theme_mode_repository.dart';
final class SetThemeModeUseCase extends UseCase<bool,ThemeModeEntity> {
  const  SetThemeModeUseCase({required this.themeModeRepository});
final ThemeModeRepository themeModeRepository;
  @override
  Future<Either<Failure, bool>> call(ThemeModeEntity themeModeEntity)async {
   try {
    final themeMode = await themeModeRepository.setThemeMode(themeModeEntity); // returns ThemeModeEntity
    return Right(themeMode); // manually wrap
  } catch (e) {
    // Wrap any error into a Failure instance
     return Left(CacheFailure('Unable to set theme mode: ${e.toString()}'));
  }

  }
}