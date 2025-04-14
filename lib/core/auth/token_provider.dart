import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenProvider {
  Future<String?> getToken();
  Future<void> saveToken(String token, int expiresIn);
  Future<void> clearToken();
  Future<bool> hasValidToken();
}

class SecureStorageTokenProvider implements TokenProvider {
  final FlutterSecureStorage secureStorage;
  
  SecureStorageTokenProvider({required this.secureStorage});
  
  static const _tokenKey = 'AUTH_TOKEN';
  static const _tokenExpiryKey = 'AUTH_TOKEN_EXPIRY';
  
  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: _tokenKey);
  }
  
  @override
  Future<void> saveToken(String token, int expiresIn) async {
    await secureStorage.write(key: _tokenKey, value: token);
    
    // Calculate expiry timestamp
    final expiryTimestamp = DateTime.now()
        .add(Duration(seconds: expiresIn))
        .millisecondsSinceEpoch
        .toString();
    
    await secureStorage.write(key: _tokenExpiryKey, value: expiryTimestamp);
  }
  
  @override
  Future<void> clearToken() async {
    await secureStorage.delete(key: _tokenKey);
    await secureStorage.delete(key: _tokenExpiryKey);
  }
  
  @override
  Future<bool> hasValidToken() async {
    final token = await getToken();
    if (token == null) return false;
    
    final expiryStr = await secureStorage.read(key: _tokenExpiryKey);
    if (expiryStr == null) return false;
    
    final expiryTimestamp = int.tryParse(expiryStr);
    if (expiryTimestamp == null) return false;
    
    final expiry = DateTime.fromMillisecondsSinceEpoch(expiryTimestamp);
    return DateTime.now().isBefore(expiry);
  }
}