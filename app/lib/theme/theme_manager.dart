import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode lightThemeMode = ThemeMode.light;
  ThemeMode darkThemeMode = ThemeMode.dark;
  get lightMode => lightThemeMode;
  get darkMode => darkThemeMode;
  toggleTheme(bool isDark) {
    lightThemeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
