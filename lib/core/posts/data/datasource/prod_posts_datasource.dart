import 'dart:developer';

import 'package:skenteas/core/posts/data/datasource/post_datasource.dart';
import 'package:skenteas/core/posts/data/models/comment.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/generated/posts/posts.pbgrpc.dart';

class ProdPostsDatasource implements PostsDatasource {
  final PostsRpcClient postsRpcClient;

  ProdPostsDatasource({required this.postsRpcClient});

  @override
  Future<List<Post>> getPosts() async {
    final listPostsDto = await postsRpcClient.fetchPosts(ResponseDto());

    final posts = listPostsDto.posts
        .map(
          (post) => Post(
            authorUsername: "Some name",
            title: post.title,
            description: post.description,
            imagePath: post.imagePath,
            likes: int.tryParse(post.likes) ?? 0,
            comments: post.comments
                .map(
                  (comment) => Comment(
                    id: int.tryParse(comment.id) ?? 0,
                    authorUsername: "authorUsername",
                    postId: int.tryParse(comment.postId) ?? 0,
                    message: comment.message,
                  ),
                )
                .toList(),
          ),
        )
        .toList();

    return posts;
  }

  @override
  Future<void> insertPost(Post post) {
    // TODO: implement insertPost
    throw UnimplementedError();
  }
}
