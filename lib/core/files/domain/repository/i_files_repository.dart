import 'dart:typed_data';

abstract interface class IFilesRepository {
  Future<void> putFile(Uint8List imageBytes, String? bucket);
  Future<Uint8List?> fetchFile({int? userId, String? bucket});
}
