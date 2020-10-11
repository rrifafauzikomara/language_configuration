import 'package:flutter/material.dart';
import 'package:language_configuration/language_configuration.dart';

import 'locale_keys.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Language _language = Language();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_language.getString(LocalKeys.home)}"),
      ),
      body: Center(
        child: Text("${_language.getString(LocalKeys.home)}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}