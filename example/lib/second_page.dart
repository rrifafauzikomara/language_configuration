import 'package:flutter/material.dart';
import 'package:language_configuration/language_configuration.dart';

import 'locale_keys.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  Language _language = Language();
  LanguageManager _languageManager = LanguageManager();

  String _idLanguage = "id";
  String _enLanguage = "en";

  loadLanguagesEn() {
    Language().loadFromAsset(_enLanguage,_enLanguage);
  }

  loadLanguagesId() {
    Language().loadFromAsset(_idLanguage,_idLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_language.getString(LocalKeys.second)),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${_language.getString(LocalKeys.indonesia)}"),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      loadLanguagesId();
                    });
                    _languageManager.savePref(_idLanguage, _idLanguage);
                  },
                  child: Icon(Icons.font_download),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${_language.getString(LocalKeys.english)}"),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      loadLanguagesEn();
                    });
                    _languageManager.savePref(_enLanguage, _enLanguage);
                  },
                  child: Icon(Icons.font_download),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}