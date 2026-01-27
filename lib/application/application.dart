import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skenteas/application/routes.dart';
import 'package:skenteas/core/consts/app_themes.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';
import 'package:skenteas/core/auth/presentation/bloc/auth_bloc.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    final authRepository = getIt<AuthRepository>();
    final keyValueStorageRepository = getIt<KeyValueStorageRepository>();
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: authRepository,
        keyValueStorageRepository: keyValueStorageRepository,
      )..add(AuthCheckTokenEvent()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routerConfig,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
      ),
    );
  }
}
