import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skenteas/core/auth/data/models/user.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';
import 'package:skenteas/core/files/domain/repository/i_files_repository.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository authRepository;
  final PostsRepository postsRepository;
  final IFilesRepository filesRepository;

  ProfileBloc({
    required this.authRepository,
    required this.postsRepository,
    required this.filesRepository,
  }) : super(ProfileInitial()) {
    on<FetchUserEvent>(_onFetchUser);
    on<PublishPostEvent>(_onPublishPost);
  }

  List<Post>? _cachedPosts;

  Future<void> _onFetchUser(
    FetchUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(ProfileLoadingState());
      UserModel? newUser;
      newUser = await authRepository.fetchUser();
      final posts = newUser.isAdmin
          ? await postsRepository.getPosts(isConfirmed: false)
          : null;

      final avatarBytes = await filesRepository.fetchAvatar();
      newUser = newUser.copyWith(imageBytes: avatarBytes);

      _cachedPosts = posts;

      emit(UserFetchedState(userModel: newUser, posts: posts));
    } on Exception catch (e, stack) {
      emit(ProfileErrorState(error: e, stack: stack));
      rethrow;
    }
  }

  Future<void> _onPublishPost(
    PublishPostEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());
    await postsRepository.publishPost(event.post);
    _cachedPosts!.remove(event.post);
    emit(SuccessPublishedProfileState());
  }
}
