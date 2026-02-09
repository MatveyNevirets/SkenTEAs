// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final KeyValueStorageRepository keyValueStorageRepository;

  AuthBloc({
    required this.authRepository,
    required this.keyValueStorageRepository,
  }) : super(UnauthenticatedState()) {
    on<AuthSignUpEvent>(_onSignUp);
    on<AuthSignInEvent>(_onSignIn);
    on<AuthLogoutEvent>(_onLogout);
    on<AuthCheckTokenEvent>(_onCheckToken);
    on<AuthGoogleSignInEvent>(_onGoogleSignIn);
  }

  Future<void> _onGoogleSignIn(
    AuthGoogleSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoadingState());

      final tokens = await authRepository.signInWithGoogle();

      await keyValueStorageRepository.write<String>(
        dotenv.env['ACCESS_TOKEN_KEY']!,
        tokens.$1,
      );
      await keyValueStorageRepository.write<String>(
        dotenv.env['REFRESH_TOKEN_KEY']!,
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
      dotenv.env['ACCESS_TOKEN_KEY']!,
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
      await keyValueStorageRepository.delete(dotenv.env['ACCESS_TOKEN_KEY']!);
      await keyValueStorageRepository.delete(dotenv.env['REFRESH_TOKEN_KEY']!);
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
          dotenv.env['ACCESS_TOKEN_KEY']!,
          tokens.$1,
        );
        await keyValueStorageRepository.write<String>(
          dotenv.env['REFRESH_TOKEN_KEY']!,
          tokens.$2,
        );

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
          dotenv.env['ACCESS_TOKEN_KEY']!,
          tokens.$1,
        );
        await keyValueStorageRepository.write<String>(
          dotenv.env['REFRESH_TOKEN_KEY']!,
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
