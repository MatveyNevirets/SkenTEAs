part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class FetchUserEvent extends ProfileEvent {}

class PublishPostEvent extends ProfileEvent {
  Post post;
  PublishPostEvent({required this.post});
}

class UserUpdateEvent extends ProfileEvent {
  UserModel userModel;
  UserUpdateEvent({required this.userModel});
}

class UsersPostStatusEvent extends ProfileEvent {
  UserModel userModel;
  UsersPostStatusEvent({required this.userModel});
}

class ChangeAvatarEvent extends ProfileEvent {}
