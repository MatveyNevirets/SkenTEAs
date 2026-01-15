import 'package:flutter/material.dart';
import 'package:skenteas/core/consts/color_consts.dart';

class ClosableScreenSliverAppBar extends StatelessWidget {
  const ClosableScreenSliverAppBar({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: panelColor,
      title: title,
    );
  }
}
