import 'package:skenteas/core/posts/data/models/comment.dart';

class Post {
  int likes;
  final String authorUsername, title, description, imagePath;
  List<Comment> comments;

  Post({
    required this.authorUsername,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.likes,
    required this.comments,
  });
}
