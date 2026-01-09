import 'package:flutter/material.dart';
import 'package:skenteas/core/color_consts.dart';
import 'package:skenteas/core/const_test_shit.dart';
import 'package:skenteas/feature/home/presentation/widgets/post_item.dart';
import 'package:skenteas/feature/home/presentation/widgets/tabs_panel.dart';
import 'package:skenteas/feature/home/presentation/widgets/up_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: panelColor,
            title: UpPanel(),
          ),
          SliverToBoxAdapter(child: TabsPanel()),
          SliverList.builder(
            itemCount: postItems.length,
            itemBuilder: (context, index) => PostItem(
              userName: postItems[index].userName,
              heading: postItems[index].heading,
              content: postItems[index].content,
            ),
          ),
        ],
      ),
    );
  }
}
