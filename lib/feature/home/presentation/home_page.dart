import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';
import 'package:skenteas/feature/home/presentation/bloc/home_bloc.dart';
import 'package:skenteas/feature/home/presentation/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    final postsRepository = getIt<PostsRepository>();
    return BlocProvider(
      create: (BuildContext context) =>
          HomeBloc(postsRepository: postsRepository)..add(GetPostsEvent()),
      child: HomeScreen(),
    );
  }
}
