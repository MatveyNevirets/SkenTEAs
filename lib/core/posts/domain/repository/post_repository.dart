import 'package:skenteas/core/posts/data/models/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> getPosts();
}
