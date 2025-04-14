import 'package:bloc_test/bloc_test.dart';
import 'package:dofit/features/auth/domain/usecases/logout.dart';
import 'package:dofit/features/auth/presentation/bloc/logout/logout_bloc.dart';
import 'package:dofit/features/auth/presentation/bloc/logout/logout_event.dart';
import 'package:dofit/features/auth/presentation/bloc/logout/logout_state.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([LogoutUseCase])
import 'logout_bloc_test.mocks.dart';

void main() {
  late MockLogoutUseCase mockLogoutUseCase;
  late LogoutBloc logoutBloc;

  setUp(() {
    mockLogoutUseCase = MockLogoutUseCase();
    logoutBloc = LogoutBloc(logoutUseCase: mockLogoutUseCase);
  });

  tearDown(() {
    logoutBloc.close();
  });

  test('initial state should be LogoutInitial', () {
    expect(logoutBloc.state, equals(LogoutInitial()));
  });

  blocTest<LogoutBloc, LogoutState>(
    'should emit [LogoutLoading, LogoutSuccess] when logout is successful',
    build: () {
      when(mockLogoutUseCase()).thenAnswer((_) async => true);
      return logoutBloc;
    },
    act: (bloc) => bloc.add(LogoutRequested()),
    expect: () => [
      LogoutLoading(),
      LogoutSuccess(),
    ],
    verify: (_) {
      verify(mockLogoutUseCase()).called(1);
    },
  );

  blocTest<LogoutBloc, LogoutState>(
    'should emit [LogoutLoading, LogoutFailure] when logout fails',
    build: () {
      when(mockLogoutUseCase()).thenAnswer((_) async => false);
      return logoutBloc;
    },
    act: (bloc) => bloc.add(LogoutRequested()),
    expect: () => [
      LogoutLoading(),
      LogoutFailure('Logout failed'),
    ],
    verify: (_) {
      verify(mockLogoutUseCase()).called(1);
    },
  );

  blocTest<LogoutBloc, LogoutState>(
    'should emit [LogoutLoading, LogoutFailure] when logout throws exception',
    build: () {
      when(mockLogoutUseCase()).thenThrow(Exception('Network error'));
      return logoutBloc;
    },
    act: (bloc) => bloc.add(LogoutRequested()),
    expect: () => [
      LogoutLoading(),
      isA<LogoutFailure>(),
    ],
    verify: (_) {
      verify(mockLogoutUseCase()).called(1);
    },
  );
}