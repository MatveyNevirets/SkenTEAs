import 'dart:typed_data';

abstract interface class IFilesDatasource {
  Future<void> putAvatar(Uint8List imageBytes);
  Future<void> deleteAvatar();
  Future<Uint8List?> fetchAvatar({int? userId});
}