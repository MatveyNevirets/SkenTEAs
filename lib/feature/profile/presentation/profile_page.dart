import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skenteas/core/auth/domain/repository/auth_repository.dart';
import 'package:skenteas/core/files/domain/repository/i_files_repository.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';
import 'package:skenteas/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:skenteas/feature/profile/presentation/profile_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    final authRepository = getIt<AuthRepository>();
    final postsRepository = getIt<PostsRepository>();
    final filesRepository = getIt<IFilesRepository>();

    return BlocProvider(
      create: (context) => ProfileBloc(
        filesRepository: filesRepository,
        authRepository: authRepository,
        postsRepository: postsRepository,
      )..add(FetchUserEvent()),
      child: ProfileScreen(),
    );
  }
}
