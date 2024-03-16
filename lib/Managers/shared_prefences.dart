import 'package:shared_preferences/shared_preferences.dart';

class BaseSharedPreferences {
  static Future<bool> saveString(String key, String value) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(key);
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(key);
  }

  static Future<bool> saveBool(String key, bool value) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.setBool(key, value);
  }

  static Future<bool> clear() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.clear();
  }
}
