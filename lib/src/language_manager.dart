import 'package:shared_preferences/shared_preferences.dart';

class LanguageManager {

  savePref(String path, String lang) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("path", path);
    preferences.setString("lang", lang);
  }

  Future<List<String>>getLang(String path, String lang) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    path = preferences.getString("path");
    lang = preferences.getString("lang");
    return [path, lang];
  }

}