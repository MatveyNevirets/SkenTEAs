part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class FetchUserEvent extends ProfileEvent {}

class PublishPostEvent extends ProfileEvent {
  Post post;
  PublishPostEvent({required this.post});
}
