import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PostsRepository postsRepository;

  HomeBloc({required this.postsRepository}) : super(HomeInitial()) {
    on<GetPostsEvent>(_onGetPosts);
  }

  Future<void> _onGetPosts(GetPostsEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeLoadingState());
      final posts = await postsRepository.getPosts();
      emit(HomePostsState(posts: posts));
    } on Object catch (e, stack) {
      emit(HomeErrorState(message: ErrorMessages.somethingWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }
}
