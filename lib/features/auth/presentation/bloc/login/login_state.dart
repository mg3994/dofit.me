import 'package:dofit/features/auth/domain/entities/auth_token.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthToken token;

  LoginSuccess(this.token);

  @override
  List<Object?> get props => [token];
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}