import 'package:flutter/material.dart';

const Color panelColor = Color.fromARGB(255, 18, 18, 18);

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<PostItem> postTabs = [
    PostItem(
      userName: "Артем Карпов",
      heading: "Заголовка",
      content:
          "Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк Очень интересный заголовок с тонной строк ",
    ),
    PostItem(userName: "вендеморка", heading: "Ei", content: "VENDEMOO"),
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

class PostItem extends StatelessWidget {
  PostItem({
    super.key,
    required this.userName,
    required this.heading,
    required this.content,
  });

  String userName;
  String heading;
  String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 400,
        color: Color.fromARGB(255, 32, 35, 37),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.man, size: 40),
                Text(
                  userName,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 250,
              child: Expanded(child: Container(color: Colors.amberAccent)),
            ),
            Row(
              children: [
                Icon(Icons.heart_broken_outlined, size: 40),
                Icon(Icons.chat, size: 40),
                Icon(Icons.share, size: 40),
                // Text(
                //   "недавний",
                //   style: TextStyle(fontSize: 18),
                //   selectionColor: Color.fromARGB(255, 136, 149, 162),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TabsPanel extends StatelessWidget {
  TabsPanel({super.key});

  final List tabs = ["Все", "Посты", "Вопросы", "Обучение"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: panelColor,
      width: 400,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) => Tab(tabs: tabs, index: index),
      ),
    );
  }
}

class Tab extends StatelessWidget {
  Tab({super.key, required this.tabs, required this.index});

  List<dynamic> tabs;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20, left: 3, right: 3),
      width: 90,
      height: 40,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 23, 23, 23),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          tabs[index],
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

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
