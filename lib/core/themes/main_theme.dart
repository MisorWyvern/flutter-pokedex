import 'package:flutter/material.dart';

Color _black = Color(0xFF212121);
Color _white = Color(0xFFFAFAFA);
Color _gray = Color(0xFF757575);
Color _primaryColorDark = Color(0xFFD32F2F);
Color _primaryColorLight = Color(0xFFFFCDD2);
Color _primaryColor = Color(0xFFF44336);
Color _accentColor = Color(0xFFCDDC39);

final ThemeData mainTheme = ThemeData(
  backgroundColor: _white,
  primarySwatch: Colors.red,
  primaryColor: _primaryColor,
  primaryColorLight: _primaryColorLight,
  primaryColorDark: _primaryColorDark,
  accentColor: _accentColor,
  textTheme: TextTheme(
    headline3: TextStyle(
        color: _black, fontSize: 8.0 * 4, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: _white, fontSize: 8.0 * 4, fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: _black, fontSize: 8.0 * 2.5, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: _white, fontSize: 8.0 * 2.5, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(color: _black),
    bodyText2: TextStyle(color: _gray),
  ),
);
