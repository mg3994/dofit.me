import 'package:dartz/dartz.dart';
import 'package:dofit/features/auth/domain/core/failure.dart';
import '../entities/auth_token.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthToken>> login(String username, String password);
  Future<bool> logout();
}