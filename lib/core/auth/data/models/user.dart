import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String username,
    Uint8List? imageBytes,
    required bool isAdmin,
  }) = _UserModel;
}
