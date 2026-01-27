import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skenteas/core/posts/data/models/comment.dart';

part 'post.freezed.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    required String id,
    required int likes,
    required bool liked,
    required List<Comment> comments,
    required String authorUsername,
    required String title,
    required String description,
    required String imagePath,
  }) = _Post;
}
