import 'package:flutter/material.dart';
import 'package:skenteas/core/color_consts.dart';
import 'package:skenteas/feature/home/presentation/widgets/post_item.dart';
import 'package:skenteas/feature/home/presentation/widgets/tabs_panel.dart';
import 'package:skenteas/feature/home/presentation/widgets/up_panel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<PostItem> postTabs = [
    PostItem(
      userName: "Артем Карпов",
      heading: "Заголовка",
      content:
          "Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк ",
    ),
    PostItem(
      userName: "вендеморка",
      heading: "Ei",
      content: "Посмотрите это интересное порно с вендеморкой!",
    ),
  ];

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
            itemCount: postTabs.length,
            itemBuilder: (context, index) => PostItem(
              userName: postTabs[index].userName,
              heading: postTabs[index].heading,
              content: postTabs[index].content,
            ),
          ),
        ],
      ),
    );
  }
}
