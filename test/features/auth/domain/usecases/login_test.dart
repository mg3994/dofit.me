import 'package:dartz/dartz.dart';
import 'package:dofit/features/auth/domain/core/failure.dart';
import 'package:dofit/features/auth/domain/entities/auth_token.dart';
import 'package:dofit/features/auth/domain/repositories/auth_repository.dart';
import 'package:dofit/features/auth/domain/usecases/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([AuthRepository])
import 'login_test.mocks.dart';

void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  final tUsername = 'testuser';
  final tPassword = 'password';
  final tAuthToken = AuthToken(
    jwtToken: 'jwt-token',
    tokenType: 'Bearer',
    expiresIn: 3600, iat: 0,
  );

  test('should get token from repository on successful login', () async {
    // Arrange
    when(mockAuthRepository.login(any, any))
        .thenAnswer((_) async => Right(tAuthToken));
    
    // Act
    final result = await loginUseCase(tUsername, tPassword);
    
    // Assert
    expect(result, equals(Right(tAuthToken)));
    verify(mockAuthRepository.login(tUsername, tPassword));
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should return failure from repository on failed login', () async {
    // Arrange
    final failure = ServerFailure('Invalid credentials');
    when(mockAuthRepository.login(any, any))
        .thenAnswer((_) async => Left(failure));
    
    // Act
    final result = await loginUseCase(tUsername, tPassword);
    
    // Assert
    expect(result, equals(Left(failure)));
    verify(mockAuthRepository.login(tUsername, tPassword));
    verifyNoMoreInteractions(mockAuthRepository);
  });
}