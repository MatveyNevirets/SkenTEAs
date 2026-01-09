import "package:flutter/material.dart";
import "package:skenteas/core/color_consts.dart";
import "package:skenteas/core/widgets/closable_screen_sliver_app_bar.dart";

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ClosableScreenSliverAppBar(
            title: Text(
              "Создать публикацию",
              style: TextStyle(color: mainTextColor),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Тип публикации",
                          style: TextStyle(color: mainTextColor),
                        ),
                        Spacer(),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: panelColor,
                          ),
                          child: Center(
                            child: Text(
                              "Тип публикации",
                              style: TextStyle(color: mainTextColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 250,
                      width: double.infinity,
                      color: secondaryColor,
                    ),
                    SizedBox(height: 50, child: TextField()),
                    SizedBox(height: 50, child: TextField()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
