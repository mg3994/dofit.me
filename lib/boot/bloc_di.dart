import 'package:dofit/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:dofit/features/auth/presentation/bloc/logout/logout_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeBlocsDeps(GetIt sl) async {
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory<LogoutBloc>(() => LogoutBloc(logoutUseCase: sl()));
}
