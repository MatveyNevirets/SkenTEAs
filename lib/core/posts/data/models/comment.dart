class Comment {
  final int id;
  final int postId;
  final String authorUsername, message;

  Comment({
    required this.id,
    required this.authorUsername,
    required this.postId,
    required this.message,
  });
}
