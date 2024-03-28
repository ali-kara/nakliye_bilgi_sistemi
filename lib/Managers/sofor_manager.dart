import 'package:nakliye_bilgi_sistemi/Managers/shared_prefences.dart';

class SoforManager {
  static const String _isLoggedIn = "LOGGEDINKEY";
  static const String _soforKodu = "USERNAMEKEY";
  static const String _userBolge = "USERBOLGE";
  static const String _userPlaka = "USERPLAKA";
  static const String _sessionId = "SESSIONID";

  static get bolge => BaseSharedPreferences.getString(_userBolge);
  static get plaka => BaseSharedPreferences.getString(_userPlaka);
  static get soforKodu => BaseSharedPreferences.getString(_soforKodu);
  static get sessionId => BaseSharedPreferences.getInt(_sessionId);

  static Future<bool> soforKoduKaydet(String value) {
    return BaseSharedPreferences.saveString(_soforKodu, value);
  }

  static Future<bool> plakaKaydet(String value) {
    return BaseSharedPreferences.saveString(_userPlaka, value);
  }

  static Future<bool> bolgeKaydet(String value) {
    return BaseSharedPreferences.saveString(_userBolge, value);
  }

  static Future<bool> saveSession(int value) {
    return BaseSharedPreferences.saveInt(_sessionId, value);
  }

  static Future<bool> logout() {
    return BaseSharedPreferences.clear();
  }

  static Future<bool> saveUserLoggedInStatus(bool value) {
    return BaseSharedPreferences.saveBool(_isLoggedIn, value);
  }

  static Future<bool> isUserLoggedIn() async {
    return await BaseSharedPreferences.getBool(_isLoggedIn) ?? false;
  }
}
