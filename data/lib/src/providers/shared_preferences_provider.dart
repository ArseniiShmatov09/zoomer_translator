import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  static late final SharedPreferences _preferences;

  SharedPreferencesProvider._();

  static Future<SharedPreferencesProvider> init() async {
    _preferences = await SharedPreferences.getInstance();
    return SharedPreferencesProvider._();
  }

  Future<void> setUser(String userKey, String userId) {
    return _preferences.setString(userKey, userId);
  }

  String? getUser(String userKey) {
    return _preferences.getString(userKey);
  }
}
