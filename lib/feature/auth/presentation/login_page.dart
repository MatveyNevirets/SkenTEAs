import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skenteas/feature/auth/domain/repository/auth_repository.dart';
import 'package:skenteas/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:skenteas/feature/auth/presentation/login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    final authRepository = getIt<AuthRepository>();
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: authRepository),
      child: LoginScreen(),
    );
  }
}
