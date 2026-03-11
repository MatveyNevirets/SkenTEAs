import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class UpPanel extends StatelessWidget {
  const UpPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: "Скен", style: TextStyle(fontSize: 20)),
                TextSpan(
                  text: "TEA",
                  style: TextStyle(
                    color: colorTheme.splashColor,
                    fontSize: 20,
                  ),
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
