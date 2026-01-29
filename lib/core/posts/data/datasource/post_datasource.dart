import 'package:skenteas/core/posts/data/models/post.dart';

abstract class PostsDatasource {
  Future<List<Post>> getPosts();
  Future<void> insertPost(Post post);
  Future<bool> changeLikesPost(String postId);
  Future<void> commentPost(String postId, String message);
}
