part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthenticatedState extends AuthState {}

class UnauthenticatedState extends AuthState {
  String? message;
  UnauthenticatedState({this.message});
}
