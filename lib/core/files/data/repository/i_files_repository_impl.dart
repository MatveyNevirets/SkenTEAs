import 'dart:typed_data';

import 'package:skenteas/core/files/data/datasource/i_files_datasource.dart';
import 'package:skenteas/core/files/domain/repository/i_files_repository.dart';

final class IFilesRepositoryImpl implements IFilesRepository {
  final IFilesDatasource filesDatasource;

  IFilesRepositoryImpl({required this.filesDatasource});

  @override
  Future<void> putAvatar(Uint8List imageBytes) async {
    try {
      await filesDatasource.putAvatar(imageBytes);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Uint8List?> fetchAvatar({int? userId}) async {
    try {
      return await filesDatasource.fetchAvatar(userId: userId);
    } catch (e) {
      rethrow;
    }
  }
}
