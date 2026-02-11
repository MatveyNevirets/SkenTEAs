// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skenteas/application/env.dart';
import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/core/files/domain/repository/i_files_repository.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';
import 'package:skenteas/core/pick_image/domain/i_pick_image_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final IFilesRepository filesRepository;
  final IPickImageService iPickImageService;
  final KeyValueStorageRepository keyValueStorageRepository;

  XFile? _cachedAvatarImage;

  AuthBloc({
    required this.authRepository,
    required this.filesRepository,
    required this.keyValueStorageRepository,
    required this.iPickImageService,
  }) : super(UnauthenticatedState()) {
    on<AuthSignUpEvent>(_onSignUp);
    on<AuthSignInEvent>(_onSignIn);
    on<AuthLogoutEvent>(_onLogout);
    on<AuthCheckTokenEvent>(_onCheckToken);
    on<AuthGoogleSignInEvent>(_onGoogleSignIn);
    on<AuthPickImageEvent>(_onPickImage);
  }

  Future<void> _onPickImage(
    AuthPickImageEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      final xFile = await iPickImageService.pickImageFromGallery();
      _cachedAvatarImage = xFile;
      emit(SuccessImageInstalledState(imagePath: xFile!.path));
    } on Object catch (e, stack) {
      emit(UnauthenticatedState(message: AppMessages.somethingWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }

  Future<void> _onGoogleSignIn(
    AuthGoogleSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());

      final tokens = await authRepository.signInWithGoogle();

      await keyValueStorageRepository.write<String>(
        Env.accessTokenKey,
        tokens.$1,
      );
      await keyValueStorageRepository.write<String>(
        Env.refreshTokenKey,
        tokens.$2,
      );

      emit(AuthenticatedState());
    } on Object catch (e, stack) {
      emit(UnauthenticatedState(message: AppMessages.somethingWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }

  Future<void> _onCheckToken(
    AuthCheckTokenEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final token = await keyValueStorageRepository.readString(
      Env.accessTokenKey,
    );

    if (token != null) {
      emit(AuthenticatedState());
    } else {
      emit(UnauthenticatedState());
    }
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      await authRepository.logout();
      await keyValueStorageRepository.delete(Env.accessTokenKey);
      await keyValueStorageRepository.delete(Env.refreshTokenKey);
      emit(UnauthenticatedState());
    } on Object catch (e, stack) {
      throw Exception("$e, StackTrace: $stack");
    }
  }

  Future<void> _onSignUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      if (event.email.isEmpty ||
          event.password.isEmpty ||
          event.username.isEmpty) {
        emit(UnauthenticatedState(message: AppMessages.fieldsMustBeFilled));
      } else {
        final tokens = await authRepository.signUp(
          event.email,
          event.password,
          event.username,
        );

        await keyValueStorageRepository.write<String>(
          Env.accessTokenKey,
          tokens.$1,
        );
        await keyValueStorageRepository.write<String>(
          Env.refreshTokenKey,
          tokens.$2,
        );

        final avatarBytes = await _cachedAvatarImage!.readAsBytes();

        await filesRepository.putAvatar(avatarBytes.buffer.asUint8List());

        emit(AuthenticatedState());
      }
    } on Object catch (e, stack) {
      emit(UnauthenticatedState(message: AppMessages.somethingWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }

  Future<void> _onSignIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(UnauthenticatedState(message: AppMessages.fieldsMustBeFilled));
      } else {
        final tokens = await authRepository.signIn(event.email, event.password);

        await keyValueStorageRepository.write<String>(
          Env.accessTokenKey,
          tokens.$1,
        );
        await keyValueStorageRepository.write<String>(
          Env.refreshTokenKey,
          tokens.$2,
        );

        emit(AuthenticatedState());
      }
    } on Object catch (e, stack) {
      emit(UnauthenticatedState(message: AppMessages.emailOrPasswordWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }
}
