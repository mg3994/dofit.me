import 'dart:async' show unawaited;

import 'package:core/adaptor/navigation/navigator.dart' show rootNavigatorKey;
import 'package:core/network/dio_connectivity_request_retrier.dart' show DioConnectivityRequestRetrier;
import 'package:core/network/interceptors/auth_request_queue.dart' show AuthRequestQueue, PendingRequest;
import 'package:core/network/retry_on_connection_change_interceptor.dart' show RetryOnConnectionChangeInterceptor;
import 'package:core/services/device_info_service.dart' show DeviceInfoService;
import 'package:packages/packages.dart';
import 'package:preferences/preferences.dart' show FlavorConfig;

import '../cache/cache.dart';

class ApiClient {
  late final Dio _dio;

  final FlavorConfig? config;
  late final Connectivity _connectivity;
   late final CacheStorage _cacheStorage;
  //  late final DeviceInfoService _deviceInfoService;

  final _authQueue = AuthRequestQueue(); // move this outside the constructor

  ApiClient({Connectivity? connectivity,CacheStorage? cacheStorage
  // ,DeviceInfoService? deviceInfoService
  , this.config}) 
      : _connectivity = connectivity ?? Connectivity(),
        _cacheStorage = cacheStorage ?? CacheStorage()
        // ,_deviceInfoService = deviceInfoService ?? DeviceInfoService() 
        {
    _dio = Dio(
      BaseOptions(
        baseUrl: config?.baseUrl ?? FlavorConfig().baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    // _dio.interceptors.addAll([
    //   DioHttpLogger(
    //     logRequestBody: true,
    //     logResponseBody: true,
    //   ),
    // ]);
     _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
            final locale =await _cacheStorage.select(_cacheStorage.localeTable).getSingleOrNull();
          final token = await cacheStorage.read('token');
          final userAgent = await DeviceInfoService.getUserAgent();
          // Inject base URL if not absolute (very rare case with Retrofit)
          if (!options.path.startsWith('http')) {
            options.path = (config?.baseUrl ?? FlavorConfig().baseUrl) + options.path;
          }

          // Add common headers
          options.headers.addAll({
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Accept-Language': locale ?? 'en',
            'User-Agent': userAgent,
           if (token != null) 'Authorization': 'Basic $token',
          });

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Handle response globally
          return handler.next(response);
        },
       onError: (DioException e, handler) async {
      if (e.response?.statusCode == 401) {
        final request = e.requestOptions;

        // Save the failing request
        _authQueue.add(PendingRequest(request));

        // Navigate to login (replace with your navigation code)
        unawaited(_handleUnauthorized(_cacheStorage));

        return; // Don't forward the error
      }

      return handler.next(e);
    },
      ),
    );
     // Adding the retry interceptor
    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: _dio,
          connectivity: connectivity,
        ),
      ),
    );
  }

  Dio get dio => _dio;
}




Future<void> _handleUnauthorized(CacheStorage _cacheStorage) async {
  // Clear token
  await _cacheStorage.write('token', null);

  // Navigate to login screen
  rootNavigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);
}