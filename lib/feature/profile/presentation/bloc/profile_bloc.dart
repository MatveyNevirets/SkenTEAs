import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skenteas/core/auth/data/models/user.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository authRepository;

  ProfileBloc({required this.authRepository}) : super(ProfileInitial()) {
    on<FetchUserEvent>(_onFetchUser);
  }

  Future<void> _onFetchUser(
    FetchUserEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(ProfileLoadingState());
      final user = await authRepository.fetchUser();
      emit(UserFetchedState(user: user));
    } on Object catch (e, stack) {
      emit(ProfileErrorState(e: e, stack: stack));
      throw Exception("$e StackTrace: $stack");
    }
  }
}
