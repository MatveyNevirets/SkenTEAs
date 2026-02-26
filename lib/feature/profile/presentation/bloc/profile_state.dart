part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class UserFetchedState extends ProfileState {
  UserModel userModel;
  List<Post>? posts, usersPosts;
  UserFetchedState({
    required this.userModel,
    this.posts,
    required this.usersPosts,
  });
}

class AvatarChangedState extends ProfileState {
  String imagePath;
  AvatarChangedState({required this.imagePath});
}

class ProfileLoadingState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  Object? error;
  StackTrace stack;
  ProfileErrorState({required this.error, required this.stack});
}

class RebuildProfileState extends ProfileState {}
