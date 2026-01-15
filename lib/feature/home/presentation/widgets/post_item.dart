import 'package:flutter/material.dart';
import 'package:skenteas/core/consts/color_consts.dart';

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
    return Container(
      width: double.infinity,
      color: secondaryPanelColor,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
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
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(height: 250, color: const Color.fromARGB(255, 37, 130, 19)),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.favorite_border, size: 30, color: secondaryColor),
              const SizedBox(width: 10),
              Icon(Icons.chat_bubble_outline, size: 30, color: secondaryColor),
              const SizedBox(width: 10),
              Icon(Icons.share, size: 30, color: secondaryColor),
              const Spacer(),
              Text(
                "1ч. назад",
                style: TextStyle(fontSize: 16, color: secondaryColor),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            heading,
            style: TextStyle(
              color: mainTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(content, style: TextStyle(color: mainTextColor, fontSize: 14)),
        ],
      ),
    );
  }
}
