import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.tabs, required this.index});

  final List<dynamic> tabs;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20, left: 3, right: 3),
      width: 90,
      height: 40,
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          tabs[index],
          style: TextStyle(fontSize: 16, color: colorScheme.primary),
        ),
      ),
    );
  }
}
