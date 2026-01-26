import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skenteas/core/extensions/theme_extensions.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/feature/home/presentation/bloc/posts_bloc.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post, this.index = 0});

  final Post post;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: theme.containerRadius,
          color: colorScheme.primaryContainer,
        ),

        padding: theme.screenPadding,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 40,
                ), // Используем person вместо man
                const SizedBox(width: 8),
                Text(
                  post.authorUsername,
                  style: TextStyle(
                    color: colorScheme.onPrimaryContainer,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: theme.containerRadius / 1.5,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                BlocBuilder<PostsBloc, PostsState>(
                  builder: (context, state) {
                    return LikeWidget(index: index, post: post);
                  },
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.chat_bubble_outline,
                  size: 30,
                  color: colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.share,
                  size: 30,
                  color: colorScheme.onPrimaryContainer,
                ),
                const Spacer(),
                Text(
                  "1ч. назад",
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              post.title,
              style: TextStyle(
                color: colorScheme.onPrimaryContainer,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              post.description,
              style: TextStyle(
                color: colorScheme.onPrimaryContainer,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LikeWidget extends StatelessWidget {
  const LikeWidget({super.key, required this.index, required this.post});

  final int index;
  final Post post;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final likes = post.likes;

    return Row(
      children: [
        IconButton(
          icon: post.liked
              ? Icon(Icons.favorite, size: 30)
              : Icon(Icons.favorite_border, size: 30),
          onPressed: () =>
              context.read<PostsBloc>().add(ChangeLikePostEvent(index: index)),
          color: colorScheme.onPrimaryContainer,
        ),
        Text(post.liked ? (likes + 1).toString() : likes.toString()),
      ],
    );
  }
}
