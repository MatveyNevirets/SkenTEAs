import 'package:skenteas/core/key_value_storage/data/datasource/key_value_datasource.dart';
import 'package:skenteas/core/key_value_storage/domain/repository/key_value_storage_repository.dart';

class KeyValueStorageRepositoryImpl implements KeyValueStorageRepository {
  final KeyValueDatasource keyValueDatasource;

  KeyValueStorageRepositoryImpl({required this.keyValueDatasource});

  @override
  Future<String?> readString(String key) async {
    return await keyValueDatasource.readString(key);
  }

  @override
  Future<void> write<T>(String key, T value) async {
    await keyValueDatasource.write(key, value);
  }
  
  @override
  Future<void> delete(String key) async {
    await keyValueDatasource.delete(key);
  }
}
