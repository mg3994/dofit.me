import 'package:dofit/features/auth/domain/usecases/logout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logout_event.dart';
import 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutBloc({required this.logoutUseCase}) : super(LogoutInitial()) {
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<LogoutState> emit,
  ) async {
    emit(LogoutLoading());

    try {
      final result = await logoutUseCase();
      
      if (result) {
        emit(LogoutSuccess());
      } else {
        emit(LogoutFailure('Logout failed'));
      }
    } catch (e) {
      emit(LogoutFailure(e.toString()));
    }
  }
}