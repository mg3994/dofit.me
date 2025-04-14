import '../../../../core/auth/token_provider.dart';
import '../models/auth_token_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthToken(AuthTokenModel token);
  Future<AuthTokenModel> getLastAuthToken();
  Future<void> clearAuthToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final TokenProvider tokenProvider;

  AuthLocalDataSourceImpl({required this.tokenProvider});

  @override
  Future<void> cacheAuthToken(AuthTokenModel token) {
    return tokenProvider.saveToken(token.jwtToken, token.expiresIn);
  }

  @override
  Future<AuthTokenModel> getLastAuthToken() async {
    final token = await tokenProvider.getToken();
    if (token != null) {
      // Note: You'll need to adapt this since the token provider only stores the JWT,
      // not the full token model
      throw UnimplementedError(
        'TokenProvider only stores the JWT, not the full model',
      );
    }
    throw Exception('No cached token found');
  }

  @override
  Future<void> clearAuthToken() {
    return tokenProvider.clearToken();
  }
}
