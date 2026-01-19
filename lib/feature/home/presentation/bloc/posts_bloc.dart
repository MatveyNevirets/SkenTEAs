import 'package:bloc/bloc.dart';
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
