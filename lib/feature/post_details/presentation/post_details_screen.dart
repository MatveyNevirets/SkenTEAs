import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skenteas/core/consts/color_consts.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/widgets/closable_screen_sliver_app_bar.dart';
import 'package:skenteas/core/widgets/must_sign_in_dialog_widget.dart';
import 'package:skenteas/feature/home/presentation/bloc/posts_bloc.dart';
import 'package:skenteas/feature/home/presentation/widgets/post_item.dart';
import 'package:skenteas/feature/post_details/presentation/widgets/commentary_item.dart';

class PostDetailsScreen extends StatelessWidget {
  PostDetailsScreen({super.key, required this.post, required this.index});

  final Post post;
  final int index;

  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ClosableScreenSliverAppBar(
            title: Text("Комментарии", style: TextStyle(color: mainTextColor)),
          ),
          SliverToBoxAdapter(child: PostItem(post: post)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hint: Text("Напишите комментарий.."),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () => context.read<PostsBloc>()
                        ..add(
                          SendCommentEvent(
                            postId: post.id,
                            message: messageController.text,
                          ),
                        ),
                      child: Text("Отправить"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is HomePostsState) {
                return SliverList.builder(
                  itemCount: state.posts[index].comments.length,
                  itemBuilder: (context, commentaryIndex) => CommentaryItem(
                    comment: state.posts[index].comments[commentaryIndex],
                  ),
                );
              }
              // TODO: Normal circular indicator
              return SliverToBoxAdapter(child: CircularProgressIndicator());
            },
            listener: (BuildContext context, PostsState state) {
              if (state is SignInDialogState) {
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) =>
                      MustSignInDialogWidget(dialogContext: dialogContext),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
