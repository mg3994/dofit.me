// File: lib/core/network/interceptors/auth_request_queue.dart

import 'package:core/core.dart' show Dio, RequestOptions;

class AuthRequestQueue {
  final List<PendingRequest> _pendingRequests = [];

  void add(PendingRequest request) {
    _pendingRequests.add(request);
  }

  Future<void> retryAll(Dio dio, String newToken) async {
    for (final request in _pendingRequests) {
      request.options.headers['Authorization'] = 'Basic $newToken';
      try {
        await dio.fetch(request.options);
      } catch (_) {
        // Optional: log retry failure
      }
    }
    _pendingRequests.clear();
  }
  Future<void> retryLast(Dio dio, String newToken) async {
    if (_pendingRequests.isNotEmpty) {
      final lastRequest = _pendingRequests.removeLast();
      lastRequest.options.headers['Authorization'] = 'Basic $newToken';
      try {
        await dio.fetch(lastRequest.options);
      } catch (_) {
        // Optional: log retry failure
      }
    }
  }

  void clear() => _pendingRequests.clear();
}

class PendingRequest {
  final RequestOptions options;
  PendingRequest(this.options);
}
