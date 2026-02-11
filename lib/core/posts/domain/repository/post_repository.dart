import 'package:skenteas/core/posts/data/models/post.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts({bool isConfirmed = true});
  Future<void> publishPost(Post post);
  Future<void> insertPost(Post post);
  Future<bool> changeLikesPost(String postId);
  Future<void> commentPost(String postId, String message);
}
