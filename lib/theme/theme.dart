import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
}

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = _lightTheme;

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // Define other light theme properties
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    // Define other dark theme properties
  );

  ThemeData get themeData => _themeData;

  void setTheme(AppTheme theme) {
    _themeData = theme == AppTheme.Light ? _lightTheme : _darkTheme;
    notifyListeners();
  }
}
