import 'package:skenteas/core/posts/data/models/post.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts();
  Future<void> insertPost(Post post);
  Future<void> changeLikesPost(String postId);
   Future<void> commentPost(String postId, String message);
}
