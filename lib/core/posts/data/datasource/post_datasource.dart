import 'package:skenteas/core/posts/data/models/post.dart';

abstract class PostsDatasource {
  Future<List<Post>> getPosts();
}
