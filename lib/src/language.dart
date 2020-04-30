library language_configuration;

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

///
/// Class for managing different configuration.
/// Use it with Language() to access the singleton.
///
class Language {
  static Language _singleton = Language._internal();

  factory Language() {
    return _singleton;
  }

  Language._internal();

  Map<String, dynamic> appConfig = Map<String, dynamic>();

  ///
  /// Loading a json configuration file with the given [name] into the current app config.
  /// The file has to be placed at assets/cfg/
  ///
  Future<Language> loadFromAsset(String fileLangFolder,String fileName) async {
    String content = await rootBundle.loadString("assets/languages/$fileLangFolder/$fileName.json");
    Map<String, dynamic> configAsMap = json.decode(content);
    appConfig.addAll(configAsMap);
    return _singleton;
  }

  /// Reads a value of any type from persistent storage.
  dynamic get(String key) => appConfig[key];

  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// bool.
  bool getBool(String key) => appConfig[key];

  /// Reads a value from persistent storage, throwing an exception if it's not
  /// an int.
  int getInt(String key) => appConfig[key];

  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// double.
  double getDouble(String key) => appConfig[key];

  /// Reads a value from persistent storage, throwing an exception if it's not a
  /// String.
  String getString(String key) => appConfig[key];

  /// Write a value from persistent storage, throwing an exception if it's not
  /// the correct type
  void setValue(key, value) => value.runtimeType != appConfig[key].runtimeType
      ? throw ("wrong type")
      : appConfig.update(key, (dynamic) => value);

  /// Adds any type to the persistent storage.
  add(Map<String, dynamic> map) => appConfig.addAll(map);

}