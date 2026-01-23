// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';
import 'package:skenteas/feature/auth/domain/repository/auth_repository.dart';

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
  }

  Future<void> _onCheckToken(
    AuthCheckTokenEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final token = await keyValueStorageRepository.readString('TOKEN_KEY');

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
      await keyValueStorageRepository.delete('TOKEN_KEY');
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
        final token = await authRepository.signUp(
          event.email,
          event.password,
          event.username,
        );

        await keyValueStorageRepository.write<String>('TOKEN_KEY', token!);

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
        final token = await authRepository.signIn(event.email, event.password);

        await keyValueStorageRepository.write<String>('TOKEN_KEY', token!);

        emit(AuthenticatedState());
      }
    } on Object catch (e, stack) {
      emit(UnauthenticatedState(message: AppMessages.emailOrPasswordWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }
}
