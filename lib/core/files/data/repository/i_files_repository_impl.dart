import 'package:skenteas/core/files/data/datasource/i_files_datasource.dart';
import 'package:skenteas/core/files/domain/repository/i_files_repository.dart';

final class IFilesRepositoryImpl implements IFilesRepository {
  final IFilesDatasource filesDatasource;

  IFilesRepositoryImpl({required this.filesDatasource});
}
