import 'package:flutter/material.dart';
import 'package:skenteas/core/color_consts.dart';

class CommentaryItem extends StatelessWidget {
  const CommentaryItem({
    super.key,
    required this.userName,
    required this.commentary,
  });

  final String userName;
  final String commentary;

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
                userName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            commentary,
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
