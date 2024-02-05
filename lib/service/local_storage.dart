import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  SharedPreferences? pref;
  _init() async {
    pref = await SharedPreferences.getInstance();
  }

  setString(String value, String key) async {
    await _init();
    pref?.setString(key, value);
  }

  Future<String> getString(String key) async {
    await _init();
    return Future.value(pref?.getString(key)??"");
  }

  setBool(bool value, String key) async {
    await _init();
    pref?.setBool(key, value);
  }
}