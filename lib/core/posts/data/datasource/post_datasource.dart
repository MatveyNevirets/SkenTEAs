import 'package:skenteas/core/posts/data/models/post.dart';

abstract class PostsDatasource {
  Future<List<Post>> getPosts();
  Future<void> insertPost(Post post);
 Future<void> changeLikesPost(String postId);
}
