import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/auth/presentation/login_screen.dart';
import 'package:skenteas/feature/create_post/presentation/create_post_page.dart';
import 'package:skenteas/feature/home/presentation/home_page.dart';
import 'package:skenteas/feature/post_details/presentation/post_details_page.dart';
import 'package:skenteas/feature/profile/presentation/profile_page.dart';

FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
  final currentLocation = state.matchedLocation;

  if (currentLocation == "/home") {
    if (currentLocation.startsWith("/home/")) {
      return null;
    }
    return "/home";
  } else if (currentLocation.startsWith("/auth")) {
    return "/auth";
  }
  return null;
}

final routerConfig = GoRouter(
  redirect: _redirect,
  initialLocation: "/auth",
  routes: [
    GoRoute(path: "/auth", builder: (context, state) => LoginScreen()),
    GoRoute(
      path: "/home",
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: "/post_details",
          builder: (context, state) {
            final data = state.extra as List;
            final post = data[0] as Post;
            final index = data[1] as int;

            return PostDetailsPage(post: post, index: index);
          },
        ),
        GoRoute(path: "/profile", builder: (context, state) => ProfilePage()),
        GoRoute(
          path: "/create_post",
          builder: (context, state) => CreatePostPage(),
        ),
      ],
    ),
  ],
);
