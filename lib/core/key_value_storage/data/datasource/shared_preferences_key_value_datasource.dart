import 'package:shared_preferences/shared_preferences.dart';
import 'package:skenteas/core/key_value_storage/data/datasource/key_value_datasource.dart';

class SharedPreferencesKeyValueDatasource implements KeyValueDatasource {
  SharedPreferences? _sharedPreferences;

  @override
  Future<String?> readString(String key) async {
    await initDatasource();

    final value = _sharedPreferences!.getString(key);

    return value;
  }

  @override
  Future<void> write<T>(String key, T value) async {
    await initDatasource();

    if (value is String) {
      await _sharedPreferences!.setString(key, value);
    }
  }

  @override
  Future<void> initDatasource() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> delete(String key) async {
    await initDatasource();

    await _sharedPreferences!.remove(key);
  }
}
