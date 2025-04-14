import 'package:dofit/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dofit/features/auth/domain/repositories/auth_repository.dart';
import 'package:dofit/features/catalog/data/repositories/catalog_repository_impl.dart';
import 'package:dofit/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeRepositoryDeps(GetIt sl) async {
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl(), tokenProvider: sl()),
  );
  sl.registerLazySingleton<CatalogRepository>(
    () => CatalogRepositoryImpl(remoteDataSource: sl()),
  );
}
