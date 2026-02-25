// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:skenteas/core/auth/data/models/user.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';
import 'package:skenteas/core/files/domain/repository/i_files_repository.dart';
import 'package:skenteas/core/pick_image/domain/i_pick_image_service.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository authRepository;
  final PostsRepository postsRepository;
  final IFilesRepository filesRepository;
  final IPickImageService iPickImageService;

  ProfileBloc({
    required this.authRepository,
    required this.postsRepository,
    required this.filesRepository,
    required this.iPickImageService,
  }) : super(ProfileInitial()) {
    on<FetchUserEvent>(_onFetchUser);
    on<PublishPostEvent>(_onPublishPost);
    on<UserUpdateEvent>(_onUserUpdate);
    on<ChangeAvatarEvent>(_onChangeAvatar);
  }

  List<Post>? _cachedPosts;

  static const String _avatarBucket = "avatars";

  Future<void> _onChangeAvatar(
    ChangeAvatarEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());
    try {
      final xFile = await iPickImageService.pickImageFromGallery();
      final avatarBytes = await xFile!.readAsBytes();
      final avatarUintList = avatarBytes.buffer.asUint8List();
      await filesRepository.putFile(avatarUintList, _avatarBucket);
      emit(AvatarChangedState(imagePath: xFile.path));
    } on Object catch (e, stack) {
      emit(ProfileErrorState(error: e, stack: stack));
      throw Exception("$e StackTrace: $stack");
    }
  }

  Future<void> _onUserUpdate(
    UserUpdateEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());
    final newUserModel = UserModel(
      id: event.userModel.id,
      username: event.userModel.username,
      password: event.userModel.password,
      email: event.userModel.email,
    );
    await authRepository.updateUser(newUserModel);
    emit(RebuildProfileState());
  }

  Future<void> _onFetchUser(
    FetchUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(ProfileLoadingState());
      UserModel? newUser;
      newUser = await authRepository.fetchUser();
      final posts = newUser.isAdmin!
          ? await postsRepository.getPosts(isConfirmed: false)
          : null;

      final avatarBytes = await filesRepository.fetchFile(bucket: "avatars");
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
    emit(RebuildProfileState());
  }
}
