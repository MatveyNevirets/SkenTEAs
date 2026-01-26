import 'package:skenteas/core/posts/data/datasource/post_datasource.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsDatasource postDatasource;

  PostsRepositoryImpl({required this.postDatasource});

  @override
  Future<List<Post>> getPosts() async {
    try {
      return await postDatasource.getPosts();
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<void> insertPost(Post post) async {
    try {
      await postDatasource.insertPost(post);
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<void> changeLikesPost(String postId) async {
    try {
      await postDatasource.changeLikesPost(postId);
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }
}
