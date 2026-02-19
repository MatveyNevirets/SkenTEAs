part of 'posts_bloc.dart';

sealed class PostsState {}

final class HomeInitial extends PostsState {}

class PostsLoadingState extends PostsState {}

class HomePostsState extends PostsState {
  HomePostsState({required this.posts});
  List<Post> posts;
}

class SuccessFilePickedState extends PostsState {
  String imagePath;
  SuccessFilePickedState({required this.imagePath});
}

class SignInDialogState extends PostsState {}

class PostsErrorState extends PostsState {
  String message;
  PostsErrorState({required this.message});
}

class CreatePostSuccessState extends PostsState {
  CreatePostSuccessState({required String message});
}

class CommentSentState extends PostsState {}
