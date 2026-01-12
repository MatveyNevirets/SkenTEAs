import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      // TODO: Later we'll must to create the color scheme adaptive theme
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: panelColor,
            title: UpPanel(),
          ),
          SliverToBoxAdapter(child: TabsPanel()),
          SliverToBoxAdapter(
            child: Center(
              child: ElevatedButton(
                onPressed: () => context.go("/create_post"),
                child: Text("Написать пост"),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: postItems.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => context.go("/post_details", extra: postItems[index]),
              child: PostItem(
                userName: postItems[index].userName,
                heading: postItems[index].heading,
                content: postItems[index].content,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
