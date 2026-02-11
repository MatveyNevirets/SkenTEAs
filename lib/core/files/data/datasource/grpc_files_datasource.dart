import 'dart:async';
import 'dart:typed_data';

import 'package:grpc/service_api.dart';
import 'package:skenteas/application/env.dart';
import 'package:skenteas/core/files/data/datasource/i_files_datasource.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';
import 'package:skenteas/generated/files/files.pbgrpc.dart';

final class GrpcFilesDatasource implements IFilesDatasource {
  final FilesRpcClient filesRpcClient;
  final KeyValueStorageRepository keyValueStorageRepository;

  GrpcFilesDatasource({
    required this.filesRpcClient,
    required this.keyValueStorageRepository,
  });

  @override
  Future<void> deleteAvatar() async {
    try {
      final token = await keyValueStorageRepository.readString(
        Env.accessTokenKey,
      );

      await filesRpcClient.deleteAvatar(
        FileDto(),
        options: CallOptions(metadata: {'accessToken': token!}),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Uint8List?> fetchAvatar() async {
    try {
      final token = await keyValueStorageRepository.readString(
        Env.accessTokenKey,
      );

      final stream = filesRpcClient.fetchAvatar(
        FileDto(),
        options: CallOptions(metadata: {'accessToken': token!}),
      );

      final buffer = BytesBuilder();

      await for (final FileDto fileChunk in stream) {
        buffer.add(fileChunk.data);
      }

      return buffer.toBytes();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> putAvatar(Uint8List imageBytes) async {
    try {
      final token = await keyValueStorageRepository.readString(
        Env.accessTokenKey,
      );

      await filesRpcClient.putAvatar(
        FileDto(data: imageBytes),
        options: CallOptions(metadata: {'accessToken': token!}),
      );
    } catch (e) {
      rethrow;
    }
  }
}
