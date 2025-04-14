import 'package:dartz/dartz.dart';
import 'package:dofit/features/auth/domain/core/failure.dart';
import '../entities/auth_token.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, AuthToken>> call(String username, String password) {
    return repository.login(username, password);
  }
}