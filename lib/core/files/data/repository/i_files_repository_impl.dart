import 'dart:typed_data';

import 'package:skenteas/core/files/data/datasource/i_files_datasource.dart';
import 'package:skenteas/core/files/domain/repository/i_files_repository.dart';

final class IFilesRepositoryImpl implements IFilesRepository {
  final IFilesDatasource filesDatasource;

  IFilesRepositoryImpl({required this.filesDatasource});

  @override
  Future<void> putFile(Uint8List imageBytes, String? bucket) async {
    try {
      await filesDatasource.putAvatar(imageBytes, bucket);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Uint8List?> fetchFile({int? userId, String? bucket}) async {
    try {
      return await filesDatasource.fetchAvatar(userId: userId, bucket: bucket);
    } catch (e) {
      rethrow;
    }
  }
}
