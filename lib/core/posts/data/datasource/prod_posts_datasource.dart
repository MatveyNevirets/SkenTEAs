import 'dart:developer';

import 'package:grpc/service_api.dart';
import 'package:skenteas/application/env.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';
import 'package:skenteas/core/posts/data/datasource/post_datasource.dart';
import 'package:skenteas/core/posts/data/models/comment.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/generated/posts/posts.pbgrpc.dart';

class ProdPostsDatasource implements PostsDatasource {
  final PostsRpcClient postsRpcClient;
  final KeyValueStorageRepository keyValueStorageRepository;

  ProdPostsDatasource({
    required this.postsRpcClient,
    required this.keyValueStorageRepository,
  });

  @override
  Future<List<Post>> getPosts() async {
    try {
      final token = await keyValueStorageRepository.readString(
        Env.accessTokenKey,
      );
      final listPostsDto = await postsRpcClient.fetchConfirmedPosts(
        RequestDto(),
        options: token != null
            ? CallOptions(metadata: {"accessToken": token})
            : null,
      );

      final posts = listPostsDto.posts.map((post) {
        return Post(
          id: post.id,
          authorUsername: post.authorUsername,
          title: post.title,
          description: post.description,
          imagePath: post.imagePath,
          likes: int.tryParse(post.likes) ?? 0,
          comments: [],
          liked: false,
        );
      }).toList();

      List<Post> filledPosts = [];

      for (final post in posts) {
        Post newPost = post;
        if (token != null) {
          final likedPosts = listPostsDto.likedPosts;
          log(likedPosts.toString());
          for (LikedPostsDto likedPost in likedPosts) {
            if (post.id == likedPost.postId) {
              newPost = post.copyWith(liked: true);
              break;
            }
          }
        }

        newPost = post.copyWith(comments: await fetchComments(post.id));
        filledPosts.add(newPost);
      }

      return filledPosts;
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  Future<List<Comment>> fetchComments(String postId) async {
    final listCommentsDto = await postsRpcClient.fetchPostComments(
      PostDto(id: postId),
    );

    return listCommentsDto.comments
        .map(
          (comment) => Comment(
            id: int.parse(comment.id),
            authorUsername: comment.authorUsername,
            postId: int.parse(comment.postId),
            message: comment.message,
          ),
        )
        .toList();
  }

  @override
  Future<void> insertPost(Post post) async {
    try {
      final token = await keyValueStorageRepository.readString(
        Env.accessTokenKey,
      );

      await postsRpcClient.insertPost(
        PostDto(
          title: post.title,
          description: post.description,
          imagePath: post.imagePath,
          isConfirmed: false,
        ),
        options: CallOptions(metadata: {'accessToken': token!}),
      );
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<bool> changeLikesPost(String postId) async {
    final token = await keyValueStorageRepository.readString(
      Env.accessTokenKey,
    );

    if (token == null) {
      return false;
    }

    await postsRpcClient.likePost(
      PostDto(id: postId),
      options: CallOptions(metadata: {"accessToken": token}),
    );

    return true;
  }

  @override
  Future<void> commentPost(String postId, String message) async {
    final token = await keyValueStorageRepository.readString(
      Env.accessTokenKey,
    );

    await postsRpcClient.commentPost(
      CommentDto(postId: postId, message: message),
      options: CallOptions(metadata: {"accessToken": token!}),
    );
  }
}
