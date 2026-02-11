part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class UserFetchedState extends ProfileState {
  UserModel userModel;
  List<Post>? posts;
  UserFetchedState({required this.userModel, this.posts});
}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  Object? error;
  StackTrace stack;
  ProfileErrorState({required this.error, required this.stack});
}

class SuccessPublishedProfileState extends ProfileState {}
