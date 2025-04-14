import 'package:dofit/boot/bloc_di.dart';
import 'package:dofit/boot/datasources_di.dart';
import 'package:dofit/boot/repositories_di.dart';
import 'package:dofit/boot/usecases_di.dart';
import 'package:dofit/config.dart';
import 'package:dofit/core/api/api_client.dart';
import 'package:dofit/core/auth/token_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register AppConfig
  sl.registerSingleton<AppConfig>(AppConfig.fromEnvironment());

  // External dependencies
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  sl.registerLazySingleton<TokenProvider>(
    () => SecureStorageTokenProvider(secureStorage: sl()),
  );

  // API Client - depends on use cases and config
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(client: sl(), tokenProvider: sl(), config: sl()),
  );

  await initializeDatasourcesDeps(sl);
  await initializeRepositoryDeps(sl);
  await initializeUseCasesDeps(sl);
  await initializeBlocsDeps(sl);
}
