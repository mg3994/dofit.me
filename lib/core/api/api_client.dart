import 'package:http/http.dart' as http;
import '../auth/token_provider.dart';
import '../../config.dart';

class ApiClient {
  final http.Client client;
  final TokenProvider tokenProvider;
  final AppConfig config;

  ApiClient({
    required this.client,
    required this.tokenProvider,
    required this.config,
  });

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('${config.apiBaseUrl}$endpoint');
    final headers = await _getHeaders();

    return await client.get(url, headers: headers);
  }

  Future<http.Response> post(String endpoint, {Object? body}) async {
    final url = Uri.parse('${config.apiBaseUrl}$endpoint');
    final headers = await _getHeaders();

    return await client.post(url, body: body, headers: headers);
  }

  Future<Map<String, String>> _getHeaders() async {
    final headers = {'Content-Type': 'application/json'};

    final token = await tokenProvider.getToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }
}
