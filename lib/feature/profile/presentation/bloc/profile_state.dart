part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class UserFetchedState extends ProfileState {
  UserFetchedState({required this.user});
  final User user;
}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  ProfileErrorState({required this.e, required this.stack});
  Object? e;
  StackTrace stack;
}
