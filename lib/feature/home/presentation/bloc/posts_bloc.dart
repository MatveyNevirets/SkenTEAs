// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;

  List<Post>? _cachedPosts;

  PostsBloc({required this.postsRepository}) : super(HomeInitial()) {
    on<GetPostsEvent>(_onGetPosts);
    on<TryCreatePostEvent>(_onTryCreatePost);
    on<ChangeLikePostEvent>(_onChangeLikePost);
    on<SendCommentEvent>(_onSendComment);
  }

  Future<void> _onSendComment(
    SendCommentEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(PostsLoadingState());

    final result = await postsRepository.commentPost(
      event.postId,
      event.message,
    );

    if (result) {
      _cachedPosts = null;

      final posts = await postsRepository.getPosts();
      _cachedPosts = posts;

      emit(HomePostsState(posts: _cachedPosts!));
    } else {
      emit(SignInDialogState());
      emit(HomePostsState(posts: _cachedPosts!));
    }
  }

  Future<void> _onChangeLikePost(
    ChangeLikePostEvent event,
    Emitter<PostsState> emit,
  ) async {
    try {
      if (_cachedPosts == null) {
        throw Exception("Posts haven't been recieved");
      }

      final cachedPost = _cachedPosts![event.index];
      final currentPost = cachedPost.copyWith(liked: !cachedPost.liked);

      final result = await postsRepository.changeLikesPost(currentPost.id);

      if (result) {
        _cachedPosts![event.index] = currentPost;
        emit(HomePostsState(posts: _cachedPosts!));
      } else {
        emit(SignInDialogState());
        emit(HomePostsState(posts: _cachedPosts!));
      }
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  Future<void> _onGetPosts(
    GetPostsEvent event,
    Emitter<PostsState> emit,
  ) async {
    try {
      emit(PostsLoadingState());
      if (_cachedPosts == null) {
        final posts = await postsRepository.getPosts();
        _cachedPosts = posts;
      }
      emit(HomePostsState(posts: _cachedPosts!));
    } on Object catch (e, stack) {
      emit(PostsErrorState(message: AppMessages.somethingWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }

  Future<void> _onTryCreatePost(
    TryCreatePostEvent event,
    Emitter<PostsState> emit,
  ) async {
    try {
      emit(PostsLoadingState());
      await postsRepository.insertPost(event.post);
      _cachedPosts = null;
      emit(CreatePostSuccessState(message: AppMessages.publishedSuccessful));
    } on Object catch (e, stack) {
      emit(PostsErrorState(message: AppMessages.somethingWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }
}
