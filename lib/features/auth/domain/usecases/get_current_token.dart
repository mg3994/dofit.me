import 'package:dartz/dartz.dart';
import '../../../../core/auth/token_provider.dart';
import '../core/failure.dart';

class GetCurrentTokenUseCase {
  final TokenProvider tokenProvider;

  GetCurrentTokenUseCase(this.tokenProvider);

  Future<Either<Failure, String>> call() async {
    try {
      final token = await tokenProvider.getToken();
      final isValid = await tokenProvider.hasValidToken();
      
      if (token != null && isValid) {
        return Right(token);
      } else {
        return Left(AuthFailure('No valid authentication token found'));
      }
    } catch (e) {
      return Left(AuthFailure('Failed to get authentication token: ${e.toString()}'));
    }
  }
}