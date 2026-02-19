import 'dart:typed_data';

import 'package:skenteas/core/files/data/datasource/i_files_datasource.dart';

final class MockFilesDatasource implements IFilesDatasource {
  Uint8List? _image;

  @override
  Future<void> deleteAvatar(String? bucket) async {
    await Future.delayed(Duration(seconds: 2));
    _image = null;
  }

  @override
  Future<Uint8List?> fetchAvatar({int? userId, String? bucket}) async {
    await Future.delayed(Duration(seconds: 2));
    return _image;
  }

  @override
  Future<void> putAvatar(Uint8List imageBytes, String? bucket) async {
    await Future.delayed(Duration(seconds: 2));
    _image = imageBytes;
  }
}
