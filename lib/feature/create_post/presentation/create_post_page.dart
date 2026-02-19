import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skenteas/core/pick_image/domain/i_pick_image_service.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';
import 'package:skenteas/feature/create_post/presentation/create_post_screen.dart';
import 'package:skenteas/feature/home/presentation/bloc/posts_bloc.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    final postsRepository = getIt<PostsRepository>();
    final iPickService = getIt<IPickImageService>();
    return BlocProvider(
      create: (BuildContext context) => PostsBloc(
        postsRepository: postsRepository,
        imagePickerService: iPickService,
      ),
      child: CreatePostScreen(),
    );
  }
}
