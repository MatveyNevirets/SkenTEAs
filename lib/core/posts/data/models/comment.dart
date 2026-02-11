import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    required int id,
    required int postId,
    int? authorId,
    Uint8List? avatarBytes,
    required String authorUsername,
    required String message,
  }) = _Comment;
}
