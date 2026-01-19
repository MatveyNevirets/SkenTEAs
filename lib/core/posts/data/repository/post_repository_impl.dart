import 'package:skenteas/core/posts/data/datasource/post_datasource.dart';
import 'package:skenteas/core/posts/data/models/post.dart';
import 'package:skenteas/core/posts/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDatasource postDatasource;

  PostRepositoryImpl({required this.postDatasource});

  @override
  Future<List<Post>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
