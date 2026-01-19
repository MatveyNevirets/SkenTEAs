import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:skenteas/core/consts/color_consts.dart";
import "package:skenteas/core/posts/data/models/post.dart";
import "package:skenteas/core/widgets/closable_screen_sliver_app_bar.dart";
import "package:skenteas/feature/home/presentation/bloc/posts_bloc.dart";

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key});

  final titleController = TextEditingController(),
      descriptionController = TextEditingController();

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
                    Text("Заголовок"),
                    SizedBox(
                      height: 50,
                      child: TextField(controller: titleController),
                    ),
                    Text("Содержание"),
                    SizedBox(
                      height: 50,
                      child: TextField(controller: descriptionController),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final post = Post(
                          authorUsername: "authorUsername",
                          title: titleController.text,
                          description: descriptionController.text,
                          imagePath: "imagePath",
                          likes: 0,
                          comments: [],
                        );
                        context.read<PostsBloc>().add(
                          TryCreatePostEvent(post: post),
                        );
                        context.pop();
                        context.read<PostsBloc>().add(GetPostsEvent());
                      },
                      child: Text("Опубликовать"),
                    ),
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
