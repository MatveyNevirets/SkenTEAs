// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/feature/auth/domain/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnauthenticatedState()) {
    on<AuthSignUpEvent>(_onSignUp);
    on<AuthSignInEvent>(_onSignIn);
    on<AuthLogoutEvent>(_onLogout);
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoadingState());
      await authRepository.logout();
      // TODO: Token cleaning from the key-value storage
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
        // TODO: Token saving into the key-value storage
        final token = await authRepository.signUp(
          event.email,
          event.password,
          event.username,
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
        final token = await authRepository.signIn(event.email, event.password);
        emit(AuthenticatedState());
      }
    } on Object catch (e, stack) {
      emit(UnauthenticatedState(message: AppMessages.emailOrPasswordWrong));
      throw Exception("$e StackTrace: $stack");
    }
  }
}
