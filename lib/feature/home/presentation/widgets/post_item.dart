import 'package:flutter/material.dart';
import 'package:skenteas/core/color_consts.dart';

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
    return Expanded(
      child: Container(
        height: 500,
        color: secondaryPanelColor,
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.man, size: 40),
                Text(
                  userName,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 250,
              child: Expanded(
                child: Container(color: const Color.fromARGB(255, 37, 130, 19)),
              ),
            ),
            Row(
              spacing: 10,
              children: [
                Icon(
                  Icons.heart_broken_outlined,
                  size: 45,
                  color: secondaryColor,
                ),
                Icon(Icons.chat, size: 45, color: secondaryColor),
                Icon(Icons.share, size: 45, color: secondaryColor),
                Expanded(child: SizedBox()),
                SizedBox(
                  child: Text(
                    "1ч. назад",
                    style: TextStyle(fontSize: 18, color: secondaryColor),
                  ),
                ),
              ],
            ),
            Text(
              heading,
              style: TextStyle(
                color: mainTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              content,
              style: TextStyle(
                color: mainTextColor,
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
