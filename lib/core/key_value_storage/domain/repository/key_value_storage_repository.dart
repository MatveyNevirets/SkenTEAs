abstract class KeyValueStorageRepository {
  Future<void> write<T>(String key, T value);
  Future<String?> readString(String key);
  Future<void> delete(String key);
}
