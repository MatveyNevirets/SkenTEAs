import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skenteas/core/consts/error_messages.dart';
import 'package:skenteas/core/extensions/theme_extensions.dart';
import 'package:skenteas/core/auth/presentation/bloc/auth_bloc.dart';
import 'package:skenteas/feature/home/presentation/bloc/posts_bloc.dart';
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
          SliverToBoxAdapter(
            // TODO: Remove later
            child: Padding(
              padding: Theme.of(context).screenPadding,
              child: Center(
                child: ElevatedButton(
                  onPressed: () => context.go("/home/profile"),
                  child: Text("Профиль"),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            // TODO: Remove later
            child: Padding(
              padding: Theme.of(context).screenPadding,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.go("/auth");
                    context.read<AuthBloc>().add(AuthLogoutEvent());
                  },
                  child: Text("Выйти из аккаунта"),
                ),
              ),
            ),
          ),
          BlocBuilder<PostsBloc, PostsState>(
            builder: (builderContext, state) {
              if (state is HomePostsState) {
                return SliverList.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (itemContext, index) => GestureDetector(
                    onTap: () => context.go(
                      "/home/post_details",
                      extra: [state.posts[index], index],
                    ),
                    child: PostItem(post: state.posts[index], index: index),
                  ),
                );
              } else if (state is PostsErrorState) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(AppMessages.somethingWrong)),
                );
              }
              // TODO: Will change it later to the normal progress indicator
              return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }
}
