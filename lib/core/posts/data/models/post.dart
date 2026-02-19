import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skenteas/core/posts/data/models/comment.dart';

part 'post.freezed.dart';

@freezed
abstract class Post with _$Post {
  const factory Post({
    required String id,
    String? authorId,
    required int likes,
    required bool liked,
    required List<Comment> comments,
    required String authorUsername,
    Uint8List? authorAvatar,
    Uint8List? imageBytes,
    required String title,
    required String description,
  }) = _Post;
}
