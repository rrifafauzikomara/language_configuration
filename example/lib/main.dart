import 'package:flutter/material.dart';
import 'package:language_configuration/language_configuration.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String defaultLang = "id";
  String path, lang;
  await LanguageManager().getLang(path, lang).then((value) {
    path = value[0];
    lang = value[1];
  } );
  await Language().loadFromAsset(path == null || path == "" ? defaultLang : path, lang == null || lang == "" ? defaultLang : lang);
  print(path);
  print(lang);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: HomePage(),
    );
  }
}