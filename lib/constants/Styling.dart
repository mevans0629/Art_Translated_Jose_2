import 'package:flutter/material.dart';

class Styling {
  static final Color _primary = Color(0xFFF3A488); // #F3A488
  static final Color _lightColor = Color.fromRGBO(229, 229, 229, 1);
  static final Color _secondary = Color(0xFF055C6E); // #055C6E;

  static final Color _iconLightColor = Colors.white;
  static final Color _iconDarkColor = Colors.black;
  static final Color _textColor = Colors.black;

  static final double defaultPadding = 20.0;

  static const double padding = 20;
  static const double avatarRadius = 45;

  static Color getPrimary() {
    return _primary;
  }

  static Color getSecondary() {
    return _secondary;
  }

  static Color getLightColor() {
    return _lightColor;
  }

  static TextStyle getTextHead6Color() {
    return TextStyle(
        color: _iconLightColor, fontSize: 54, fontWeight: FontWeight.bold);
  }

  static TextStyle getLinkTextStyle(double wh) {
    return TextStyle(
      decoration: TextDecoration.underline,
      fontFamily: 'OpenSans',
      fontSize: wh / 80,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    );
  }

  static TextStyle getLinkDetailsTextStyle(double wh) {
    return TextStyle(
      decoration: TextDecoration.none,
      fontFamily: 'OpenSans',
      fontSize: wh / 100,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static TextStyle getHead1Style(double wh) {
    return TextStyle(
      color: Colors.black,
      fontFamily: 'Monserrat',
      fontSize: wh / 70,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle getBodyTextStyle(double wh) {
    return TextStyle(
      color: Colors.black,
      fontFamily: 'Monserrat',
      fontSize: wh / 75,
      fontWeight: FontWeight.w300,
    );
  }

  static Color getProbabilityColor(String value) {
    if (value == "High")
      return Colors.green;
    else if (value == "Medium")
      return Colors.yellow;
    else
      return Colors.red;
  }

  static TextStyle getProbabilityTextStyle(double wh, Color color) {
    return TextStyle(
      color: color,
      fontFamily: 'Monserrat',
      fontSize: wh / 135,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle getDetailsTextStyle(double wh) {
    return TextStyle(
      color: Colors.black,
      fontFamily: 'OpenSans',
      fontSize: wh / 70,
      fontWeight: FontWeight.w300,
    );
  }

  static Color getIconLightColor() {
    return _iconLightColor;
  }

  static Color getDarkLightColor() {
    return _iconDarkColor;
  }

  static ThemeData getThemeData(BuildContext context) {
    return new ThemeData(
      primaryColor: Styling.getPrimary(),
      scaffoldBackgroundColor: Styling.getSecondary(),
      secondaryHeaderColor: Styling.getSecondary(),
      fontFamily: 'Montserrat',
      brightness: Brightness.dark,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Styling._textColor,
          ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
    );
  }

  static TextStyle getButtonStyle(double fontSize, bool lightColor) {
    Color _color = _iconDarkColor;
    if (lightColor) {
      _color = _iconLightColor;
    }
    return TextStyle(
        color: _color,
        fontFamily: 'Monserrat',
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        letterSpacing: 2.32);
  }

  static TextStyle getLabelStyle(double fontSize, bool lightColor) {
    Color _color = _iconDarkColor;
    if (lightColor) {
      _color = _iconLightColor;
    }
    return TextStyle(
        color: _color,
        fontFamily: 'Monserrat',
        fontSize: fontSize,
        fontWeight: FontWeight.normal);
  }

  static TextStyle getInputTextStyle(double wh) {
    return TextStyle(
      color: Colors.black,
      fontSize: wh / 75.0,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle getTitleTextStyle(Color color, double wh) {
    return TextStyle(
      color: color,
      fontFamily: 'Monserrat',
      fontSize: wh / 35,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle getMainTextStyle(bool secondColor) {
    Color _color = _primary;
    if (secondColor) {
      _color = _secondary;
    }
    return TextStyle(
        color: _iconLightColor,
        fontFamily: 'FrederickatheGreat',
        fontSize: 38.0,
        fontWeight: FontWeight.bold);
  }
}
