import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
  ) async {}
}
