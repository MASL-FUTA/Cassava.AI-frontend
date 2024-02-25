import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  static SharedPreferences? pref;
  static _init() async {
    pref = await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    await _init();
    await pref!.setString(key, value);
  }

  static Future<String> getString(String key) async {
    await _init();
    return Future.value(pref?.getString(key)??"");
  }

  static setBool(bool value, String key) async {
    await _init();
    await pref!.setBool(key, value);
  }

  static clear(){
    _init();
    pref!.clear();
  }
}