import 'package:skenteas/core/posts/data/datasource/post_datasource.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsDatasource postDatasource;

  PostsRepositoryImpl({required this.postDatasource});

  @override
  Future<List<Post>> getPosts({bool isConfirmed = true}) async {
    try {
      return await postDatasource.getPosts(isConfirmed: isConfirmed);
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
  Future<bool> changeLikesPost(String postId) async {
    try {
      final result = await postDatasource.changeLikesPost(postId);
      return result;
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<void> commentPost(String postId, String message) async {
    try {
      await postDatasource.commentPost(postId, message);
    } on Object catch (e, stack) {
      throw Exception("$e StackTrace: $stack");
    }
  }

  @override
  Future<void> publishPost(Post post) async {
    try {
      await postDatasource.publishPost(post);
    } catch (e) {
      rethrow;
    }
  }
}
