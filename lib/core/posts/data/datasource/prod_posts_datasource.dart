import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/service_api.dart';
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
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<void> insertPost(Post post) async {
    try {
      final token = await keyValueStorageRepository.readString(
        dotenv.env['ACCESS_TOKEN_KEY']!,
      );

      await postsRpcClient.insertPost(
        PostDto(
          title: post.title,
          description: post.description,
          imagePath: post.imagePath,
        ),
        options: CallOptions(metadata: {'accessToken': token!}),
      );
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }
}
