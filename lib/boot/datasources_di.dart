import 'package:dofit/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:dofit/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dofit/features/catalog/data/datasources/catalog_remote_datasource.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeDatasourcesDeps(GetIt sl) async {
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(tokenProvider: sl()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: sl(),
      config: sl(), // Provide the config
    ),
  );
  sl.registerLazySingleton<CatalogRemoteDataSource>(
    () => CatalogRemoteDataSourceImpl(
      client: sl(),
      config: sl(),
      apiClient: sl(),
    ),
  );
}
