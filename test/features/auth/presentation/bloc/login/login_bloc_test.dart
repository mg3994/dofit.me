import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dofit/features/auth/domain/core/failure.dart';
import 'package:dofit/features/auth/domain/entities/auth_token.dart';
import 'package:dofit/features/auth/domain/usecases/login.dart';
import 'package:dofit/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:dofit/features/auth/presentation/bloc/login/login_event.dart';
import 'package:dofit/features/auth/presentation/bloc/login/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mock classes
@GenerateMocks([LoginUseCase])
import 'login_bloc_test.mocks.dart';

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginBloc loginBloc;

  setUp(() {
    // Initialize mocks before each test
    mockLoginUseCase = MockLoginUseCase();
    loginBloc = LoginBloc(loginUseCase: mockLoginUseCase);
  });

  tearDown(() {
    // Clean up after each test
    loginBloc.close();
  });

  // Test data
  final tUsername = 'testuser';
  final tPassword = 'password';
  final tAuthToken = AuthToken(
    jwtToken: 'jwt-token',
    tokenType: 'Bearer',
    expiresIn: 3600, iat: 0,
  );

  test('initial state should be LoginInitial', () {
    // Assert
    expect(loginBloc.state, equals(LoginInitial()));
  });

  blocTest<LoginBloc, LoginState>(
    'should emit [LoginLoading, LoginSuccess] when login is successful',
    build: () {
      // Arrange - set up the mock to return successful result
      when(mockLoginUseCase(any, any))
          .thenAnswer((_) async => Right(tAuthToken));
      return loginBloc;
    },
    act: (bloc) => bloc.add(LoginSubmitted(
      username: tUsername,
      password: tPassword,
    )),
    // What we expect the bloc to emit
    expect: () => [
      LoginLoading(),
      LoginSuccess(tAuthToken),
    ],
    verify: (_) {
      // Verify the usecase was called with correct params
      verify(mockLoginUseCase(tUsername, tPassword));
    },
  );

  blocTest<LoginBloc, LoginState>(
    'should emit [LoginLoading, LoginFailure] when login fails',
    build: () {
      // Arrange - set up the mock to return failure
      final failure = ServerFailure('Invalid credentials');
      when(mockLoginUseCase(any, any))
          .thenAnswer((_) async => Left(failure));
      return loginBloc;
    },
    act: (bloc) => bloc.add(LoginSubmitted(
      username: tUsername,
      password: tPassword,
    )),
    // What we expect the bloc to emit
    expect: () => [
      LoginLoading(),
      LoginFailure('Invalid credentials'),
    ],
    verify: (_) {
      // Verify the usecase was called with correct params
      verify(mockLoginUseCase(tUsername, tPassword));
    },
  );
}