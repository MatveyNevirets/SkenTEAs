import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    int? id,
    String? username,
    email,
    password,
    Uint8List? imageBytes,
    bool? isAdmin,
  }) = _UserModel;
}
