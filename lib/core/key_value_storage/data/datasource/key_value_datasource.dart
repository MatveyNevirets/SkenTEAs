abstract class KeyValueDatasource {
  Future<void> initDatasource();
  Future<String?> readString(String key);
  Future<void> write<T>(String key, T value);
  Future<void> delete(String key);
}
