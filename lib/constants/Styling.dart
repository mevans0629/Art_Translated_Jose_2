import 'package:flutter/material.dart';

class Styling {
  static final Color _primary = Color(0xFFF3A488); // #F3A488
  static final Color _lightColor = Color.fromRGBO(229, 229, 229, 1);
  static final Color _secondary = Color(0xFF055C6E); // #055C6E;

  static final Color _iconLightColor = Colors.white;
  static final Color _iconDarkColor = Colors.black;

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
    ;
  }

  static Color getIconLightColor() {
    return _iconLightColor;
  }

  static Color getDarkLightColor() {
    return _iconDarkColor;
  }

  static ThemeData getThemeData() {
    return new ThemeData(
      primaryColor: Styling.getPrimary(),
      secondaryHeaderColor: Styling.getSecondary(),
      fontFamily: 'Montserrat',
      brightness: Brightness.dark,
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

  static TextStyle getInputTextStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w300);
  }

  static TextStyle getTitleTextStyle() {
    return TextStyle(color: _iconLightColor, fontSize: 38.0);
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
