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
}
