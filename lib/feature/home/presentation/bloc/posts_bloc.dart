// ignore: depend_on_referenced_packages
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/core/pick_image/data/image_picker_service.dart';
import 'package:skenteas/core/pick_image/domain/i_pick_image_service.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository postsRepository;
  final IPickImageService imagePickerService;

  List<Post>? _cachedPosts;
  XFile? _cachedFileImage;

  PostsBloc({required this.postsRepository, required this.imagePickerService})
    : super(HomeInitial()) {
    on<GetPostsEvent>(_onGetPosts);
    on<TryCreatePostEvent>(_onTryCreatePost);
    on<ChangeLikePostEvent>(_onChangeLikePost);
    on<SendCommentEvent>(_onSendComment);
    on<PickImageEvent>(_onPickImage);
  }

  Future<void> _onPickImage(
    PickImageEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(PostsLoadingState());
    _cachedFileImage = null;
    final file = await imagePickerService.pickImageFromGallery();

    if (file == null) {
      emit(HomePostsState(posts: _cachedPosts!));
    } else {
      _cachedFileImage = file;
      emit(SuccessFilePickedState(imagePath: file.path));
    }
  }

  Future<void> _onSendComment(
    SendCommentEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(PostsLoadingState());

    await postsRepository.commentPost(event.postId, event.message);
    _cachedPosts = null;

    final posts = await postsRepository.getPosts();
    _cachedPosts = posts;

    emit(HomePostsState(posts: _cachedPosts!));
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
      final imageAsBytes = await _cachedFileImage?.readAsBytes();
      final newPost = event.post.copyWith(imageBytes: imageAsBytes);
      await postsRepository.insertPost(newPost);
      _cachedPosts = null;
      emit(CreatePostSuccessState(message: AppMessages.publishedSuccessful));
    } on Object catch (e, stack) {
      emit(PostsErrorState(message: AppMessages.somethingWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }
}
