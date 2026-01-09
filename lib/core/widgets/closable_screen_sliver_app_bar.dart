import 'package:flutter/material.dart';
import 'package:skenteas/core/color_consts.dart';

class ClosableScreenSliverAppBar extends StatelessWidget {
  const ClosableScreenSliverAppBar({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: panelColor,
      title: Row(
        children: [
          //IconButton(
          Icon(Icons.close, size: 30, color: mainTextColor),
          //onPressed: () => Navigator.pop(context),
          //),
          Expanded(child: Center(child: title)),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
