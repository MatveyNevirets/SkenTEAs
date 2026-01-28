import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';
import 'package:skenteas/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:skenteas/feature/profile/presentation/profile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    final authRepository = getIt<AuthRepository>();

    return BlocProvider(
      create: (context) => ProfileBloc(authRepository: authRepository),
      child: ProfileScreen(),
    );
  }
}
