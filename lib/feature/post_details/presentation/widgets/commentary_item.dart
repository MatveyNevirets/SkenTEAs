import 'package:flutter/material.dart';
import 'package:skenteas/core/consts/color_consts.dart';
import 'package:skenteas/core/posts/data/models/comment.dart';

class CommentaryItem extends StatelessWidget {
  const CommentaryItem({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: secondaryPanelColor,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 40),
              const SizedBox(width: 8),
              Text(
                comment.authorUsername,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            comment.message,
            style: TextStyle(color: mainTextColor, fontSize: 14),
            maxLines: null,
            softWrap: true,
          ),
          Row(
            children: [
              Spacer(),
              Text(
                "1ч. назад",
                style: TextStyle(fontSize: 16, color: secondaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
