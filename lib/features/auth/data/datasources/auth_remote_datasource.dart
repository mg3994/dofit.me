import 'dart:convert';
import 'package:dofit/config.dart';
import 'package:http/http.dart' as http;
import '../models/auth_token_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel> login(String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final AppConfig config;

  AuthRemoteDataSourceImpl({required this.client, required this.config});

  @override
  Future<AuthTokenModel> login(String username, String password) async {
    final url = Uri.parse('${config.apiBaseUrl}wp-json/api/v1/token');

    // Create form data
    var request =
        http.MultipartRequest('POST', url)
          ..fields['username'] = username
          ..fields['password'] = password;

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return AuthTokenModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to authenticate: ${response.body}');
    }
  }
}
