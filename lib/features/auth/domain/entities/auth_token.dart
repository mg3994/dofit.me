class AuthToken {
  final String tokenType;
  final int iat;
  final int expiresIn;
  final String jwtToken;

  AuthToken({
    required this.tokenType,
    required this.iat,
    required this.expiresIn,
    required this.jwtToken,
  });

  bool get isExpired => DateTime.now().millisecondsSinceEpoch ~/ 1000 > expiresIn;
}