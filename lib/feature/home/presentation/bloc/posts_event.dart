part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class GetPostsEvent extends PostsEvent {}

class TryCreatePostEvent extends PostsEvent {
  TryCreatePostEvent({required this.post});
  final Post post;
}
