import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';
import 'package:skenteas/feature/home/presentation/bloc/posts_bloc.dart';
import 'package:skenteas/feature/post_details/presentation/post_details_screen.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({super.key, required this.post, required this.index});

  final Post post;
  final int index;

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    return BlocProvider(
      create: (context) =>
          PostsBloc(postsRepository: getIt<PostsRepository>())
            ..add(GetPostsEvent()),
      child: PostDetailsScreen(post: post, index: index),
    );
  }
}
