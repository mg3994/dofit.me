import 'package:core/core.dart';


import 'package:thememoder/domain/repository/theme_mode_repository.dart';
final class ResetThemeModeUseCase extends UseCase<bool,NoParams> {
  const  ResetThemeModeUseCase({required this.themeModeRepository});
final ThemeModeRepository themeModeRepository;
  @override
  Future<Either<Failure, bool>> call(noParams)async {
   try { // What reset Does is Just Delete the stored value in key or say delete th key
    final themeMode = await themeModeRepository.resetThemeMode(); // returns bool
    return Right(themeMode); // manually wrap
  } catch (e) {
    // Wrap any error into a Failure instance
     return Left(CacheFailure('Unable to reset theme mode: ${e.toString()}'));
  }

  }
}