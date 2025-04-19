import 'package:packages/packages.dart';
import 'package:preferences/preferences.dart' show FlavorConfig;

import '../cache/cache.dart';

class  ApiClient {
  late final Dio _dio = Dio();
  // const ApiClient(this.config, this.cacheManager, this.dio);
  final FlavorConfig? config;
  // final CacheStorage?  cacheManager;

  ApiClient(this.config, 
  // {this.cacheManager}
  ){
    _dio.options = BaseOptions(
        baseUrl: config?.baseUrl ?? FlavorConfig().baseUrl, // the place for your base url
        // receiveTimeout: Duration(seconds: 30),
        // connectTimeout: Duration(seconds: 30),
        // sendTimeout: Duration(seconds: 30),
        );
}
// .. complete it wit dio and its inspector
Dio get apiClient => _dio;
}