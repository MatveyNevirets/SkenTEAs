import "package:flutter/material.dart";

class UpPanel extends StatelessWidget {
  const UpPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Icon(
            Icons.heart_broken_rounded,
            size: 40,
            color: Color.fromARGB(225, 110, 80, 8),
          ),
        ),
        Expanded(
          flex: 2,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "Скен", style: TextStyle(fontSize: 20)),
                TextSpan(
                  text: "TEA",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                TextSpan(text: "сь", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
        Expanded(flex: 2, child: SizedBox(height: 50, child: TextField())),
      ],
    );
  }
}
