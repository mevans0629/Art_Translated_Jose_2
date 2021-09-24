import 'package:art_translated/screens/splash_screen.dart';
import 'package:art_translated/constants/Strings.dart';
import 'package:art_translated/constants/Styling.dart';
import 'package:flutter/material.dart';

void main() {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  */
  runApp(ArtTranslatedApp());
}

class ArtTranslatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.titleApp,
      theme: Styling.getThemeData(context),
      home: Splash(),
    );
  }
}
