import '../../domain/entities/auth_token.dart';

class AuthTokenModel extends AuthToken {
  AuthTokenModel({
    required super.tokenType,
    required super.iat,
    required super.expiresIn,
    required super.jwtToken,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      tokenType: json['token_type'],
      iat: json['iat'],
      expiresIn: json['expires_in'],
      jwtToken: json['jwt_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token_type': tokenType,
      'iat': iat,
      'expires_in': expiresIn,
      'jwt_token': jwtToken,
    };
  }
}