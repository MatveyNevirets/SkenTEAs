import 'package:skenteas/core/posts/data/models/comment.dart';

class Post {
  int likes;
  final String id, authorUsername, title, description, imagePath;
  bool liked;
  List<Comment> comments;

  Post({
    this.id = "",
    required this.authorUsername,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.likes,
    required this.comments,
    this.liked = false,
  });
}
