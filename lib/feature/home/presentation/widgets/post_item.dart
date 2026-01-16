import 'package:flutter/material.dart';
import 'package:skenteas/core/extensions/theme_extensions.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.userName,
    required this.heading,
    required this.content,
  });

  final String userName;
  final String heading;
  final String content;

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
                  userName,
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
                Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: colorScheme.onPrimaryContainer,
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
              heading,
              style: TextStyle(
                color: colorScheme.onPrimaryContainer,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
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
