import "package:flutter/material.dart";
import "package:skenteas/core/widgets/tab_item.dart";

class TabsPanel extends StatelessWidget {
  TabsPanel({super.key});

  final List tabs = ["Все", "Посты", "Вопросы", "Обучение"];

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context);
    return Container(
      color: colorTheme.hoverColor,
      width: 400,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) => TabItem(tabs: tabs, index: index),
      ),
    );
  }
}
