import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skenteas/feature/create_post/create_post_screen.dart';
import 'package:skenteas/feature/home/presentation/home_screen.dart';
import 'package:skenteas/feature/home/presentation/widgets/post_item.dart';
import 'package:skenteas/feature/post_details/presentation/post_details_screen.dart';

final _routerConfig = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: "/post_details",
          builder: (context, state) {
            final post = state.extra as PostItem;

            return PostDetailsScreen(postItem: post);
          },
        ),
        GoRoute(
          path: "/create_post",
          builder: (context, state) => CreatePostScreen(),
        ),
      ],
    ),
  ],
);

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Later we'll must to create the color scheme adaptive theme
    return MaterialApp.router(
      routerConfig: _routerConfig,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      ),
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        scaffoldBackgroundColor: Color.fromARGB(255, 22, 23, 24),
      ),
    );
  }
}
