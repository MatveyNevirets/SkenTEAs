import 'dart:typed_data';

abstract interface class IFilesRepository {
Future<void> putAvatar(Uint8List imageBytes);
Future<Uint8List?> fetchAvatar();
}
