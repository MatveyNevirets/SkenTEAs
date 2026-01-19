part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class HomeInitial extends PostsState {}

class PostsLoadingState extends PostsState {}

class HomePostsState extends PostsState {
  HomePostsState({required this.posts});
  List<Post> posts;
}

class PostsErrorState extends PostsState {
  String message;
  PostsErrorState({required this.message});
}

class CreatePostSuccessState extends PostsState {
  CreatePostSuccessState({required String message});
}
