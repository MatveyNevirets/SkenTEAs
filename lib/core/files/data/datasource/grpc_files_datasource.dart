import 'package:skenteas/core/files/data/datasource/i_files_datasource.dart';
import 'package:skenteas/generated/files/files.pbgrpc.dart';

final class GrpcFilesDatasource implements IFilesDatasource {
  final FilesRpcClient filesRpcClient;

  GrpcFilesDatasource({required this.filesRpcClient});
}