import 'package:skenteas/core/posts/data/models/post.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts();
  Future<void> insertPost(Post post);
}
