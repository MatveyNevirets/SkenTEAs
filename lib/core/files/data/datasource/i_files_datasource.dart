import 'dart:typed_data';

abstract interface class IFilesDatasource {
  Future<void> putAvatar(Uint8List imageBytes, String? bucket);
  Future<void> deleteAvatar(String? bucket);
  Future<Uint8List?> fetchAvatar({int? userId, String? bucket});
}
