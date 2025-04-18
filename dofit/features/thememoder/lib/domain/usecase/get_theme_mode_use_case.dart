import 'package:core/core.dart';

import 'package:thememoder/domain/entity/theme_mode_entity.dart';
import 'package:thememoder/domain/repository/theme_mode_repository.dart';
final class GetThemeModeUseCase extends UseCase<ThemeModeEntity,NoParams> {
  const  GetThemeModeUseCase({required this.themeModeRepository});
final ThemeModeRepository themeModeRepository;
  @override
  Future<Either<Failure, ThemeModeEntity>> call(noParams)async {
   try {
    final themeMode = await themeModeRepository.getThemeMode(); // returns ThemeModeEntity
    return Right(themeMode); // manually wrap
  } catch (e) {
    // Wrap any error into a Failure instance
     return Left(CacheFailure('Unable to fetch theme mode: ${e.toString()}'));
  }

  }
}