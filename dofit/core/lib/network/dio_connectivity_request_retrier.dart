// lib/core/network/dio_connectivity_request_retrier.dart

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetrier({
    required this.dio,
    required this.connectivity,
  });

  // Schedule the request retry once internet is available
  Future<Response<dynamic>> scheduleRequestRetry(RequestOptions requestOptions) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      await _waitForConnectivity();
    }

    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      extra: requestOptions.extra,
    );

    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
      cancelToken: requestOptions.cancelToken,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
    );
  }

  // Wait until connectivity is available
  Future<void> _waitForConnectivity() async {
    final completer = Completer<void>();
    final subscription = connectivity.onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none) {
        completer.complete();
      }
    });
    await completer.future;
    await subscription.cancel();
  }
}
