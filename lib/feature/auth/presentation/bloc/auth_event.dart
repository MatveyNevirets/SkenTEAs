part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  String email, password, username;

  AuthSignUpEvent({
    required this.email,
    required this.password,
    required this.username,
  });
}

class AuthSignInEvent extends AuthEvent {
  String email, password;

  AuthSignInEvent({required this.email, required this.password});
}

class AuthLogoutEvent extends AuthEvent {}
