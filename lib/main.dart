import 'package:art_translated/constants/Strings.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:art_translated/screens/translator_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ArtTranslatedApp());
}

class ArtTranslatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.titleApp,
      theme: Styling.getThemeData(),
      home: TranslatorPage(title: Strings.titleApp),
    );
  }
}
