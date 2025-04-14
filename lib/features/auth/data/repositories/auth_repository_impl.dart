import 'package:dartz/dartz.dart';
import '../../../../core/auth/token_provider.dart';
import '../../domain/core/failure.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenProvider tokenProvider;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenProvider,
  });

  @override
  Future<Either<Failure, AuthToken>> login(
    String username,
    String password,
  ) async {
    try {
      final tokenModel = await remoteDataSource.login(username, password);

      // Save the token using the token provider
      await tokenProvider.saveToken(tokenModel.jwtToken, tokenModel.expiresIn);

      return Right(tokenModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await tokenProvider.clearToken();
      return true;
    } catch (e) {
      return false;
    }
  }
}
