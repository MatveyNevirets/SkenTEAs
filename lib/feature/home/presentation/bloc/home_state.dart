part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomePostsState extends HomeState {
  HomePostsState({required this.posts});
  List<Post> posts;
}

class HomeErrorState extends HomeState {
  String message;
  HomeErrorState({required this.message});
}
