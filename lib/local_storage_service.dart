import 'package:shared_preferences/shared_preferences.dart';
import'main.dart';
class LocalStorageService {
  var k=9;
  static late LocalStorageService _instance;
  static late SharedPreferences _preferences;

  static const String number_key = 'number';
  static const String bin_number_key = 'bin number';
  static Future<LocalStorageService> getInstance() async {
    _instance = LocalStorageService();
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  dynamic _getFromDisk(String key) {
    final value = _preferences.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  int get number => _getFromDisk(number_key);
  int get bin_number => _getFromDisk(bin_number_key);

  set number(int number) {
    _saveToDisk(number_key,number);
  }

  set bin_number(int bin_number) {
    _saveToDisk(bin_number_key, bin_number);
  }

}