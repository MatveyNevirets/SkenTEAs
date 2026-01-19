import 'package:flutter/material.dart';
import 'package:skenteas/core/consts/color_consts.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/widgets/closable_screen_sliver_app_bar.dart';
import 'package:skenteas/feature/home/presentation/widgets/post_item.dart';
import 'package:skenteas/feature/post_details/presentation/widgets/commentary_item.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ClosableScreenSliverAppBar(
            title: Text("Комментарии", style: TextStyle(color: mainTextColor)),
          ),
          SliverToBoxAdapter(
            child: PostItem(
              authorUsername: post.authorUsername,
              title: post.title,
              description: post.description,
            ),
          ),
          SliverList.builder(
            itemCount: post.comments.length,
            itemBuilder: (context, index) => CommentaryItem(
              userName: post.comments[index].authorUsername,
              commentary: post.comments[index].message,
            ),
          ),
        ],
      ),
    );
  }
}
