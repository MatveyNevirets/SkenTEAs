import 'package:skenteas/core/posts/data/models/post.dart';

abstract interface class PostDatasource {
  Future<List<Post>> getPosts();
}
