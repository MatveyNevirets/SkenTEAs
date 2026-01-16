import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skenteas/core/consts/const_test_shit.dart';
import 'package:skenteas/core/extensions/theme_extensions.dart';
import 'package:skenteas/feature/home/presentation/widgets/post_item.dart';
import 'package:skenteas/feature/home/presentation/widgets/tabs_panel.dart';
import 'package:skenteas/feature/home/presentation/widgets/up_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: colorScheme.primary,
            title: UpPanel(),
          ),
          SliverToBoxAdapter(child: TabsPanel()),

          SliverToBoxAdapter(
            // TODO: Remove later
            child: Padding(
              padding: Theme.of(context).screenPadding,
              child: Center(
                child: ElevatedButton(
                  onPressed: () => context.go("/home/create_post"),
                  child: Text("Написать пост"),
                ),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: postItems.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () =>
                  context.go("/home/post_details", extra: postItems[index]),
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
