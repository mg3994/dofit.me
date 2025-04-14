// Register AppConfig
import 'package:dofit/core/auth/token_provider.dart';
import 'package:dofit/features/auth/domain/usecases/get_current_token.dart';
import 'package:dofit/features/auth/domain/usecases/login.dart';
import 'package:dofit/features/auth/domain/usecases/logout.dart';
import 'package:dofit/features/catalog/domain/usecases/get_categories_usecase.dart';
import 'package:dofit/features/catalog/domain/usecases/get_workouts_usecase.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeUseCasesDeps(GetIt sl) async {
  sl.registerLazySingleton<GetCurrentTokenUseCase>(
    () => GetCurrentTokenUseCase(sl<TokenProvider>()),
  );
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));


  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(sl()),
  );
  sl.registerLazySingleton<GetWorkoutsUseCase>(() => GetWorkoutsUseCase(sl()));
}
