import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skenteas/feature/auth/presentation/login_page.dart';
import 'package:skenteas/feature/create_post/create_post_screen.dart';
import 'package:skenteas/feature/home/presentation/home_page.dart';
import 'package:skenteas/feature/home/presentation/home_screen.dart';
import 'package:skenteas/feature/home/presentation/widgets/post_item.dart';
import 'package:skenteas/feature/post_details/presentation/post_details_screen.dart';

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
    GoRoute(path: "/auth", builder: (context, state) => LoginPage()),
    GoRoute(
      path: "/home",
      builder: (context, state) => HomePage(),
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
