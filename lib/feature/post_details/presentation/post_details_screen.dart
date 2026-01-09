import 'package:flutter/material.dart';
import 'package:skenteas/core/color_consts.dart';
import 'package:skenteas/core/const_test_shit.dart';
import 'package:skenteas/core/widgets/closable_screen_sliver_app_bar.dart';
import 'package:skenteas/feature/home/presentation/widgets/post_item.dart';
import 'package:skenteas/feature/post_details/presentation/widgets/commentary_item.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key, required this.postItem});

  final PostItem postItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ClosableScreenSliverAppBar(
            title: Text("Комментарии", style: TextStyle(color: mainTextColor)),
          ),
          SliverToBoxAdapter(child: postItem),
          SliverList.builder(
            itemCount: commentaryItems.length,
            itemBuilder: (context, index) => CommentaryItem(
              userName: commentaryItems[index].userName,
              commentary: commentaryItems[index].commentary,
            ),
          ),
        ],
      ),
    );
  }
}
