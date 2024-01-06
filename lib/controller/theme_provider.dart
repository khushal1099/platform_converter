import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/main.dart';

class ThemeProvider extends ChangeNotifier {
  String currentTheme = 'system';

  ThemeMode get thememode {
    if (currentTheme == 'light') {
      return ThemeMode.light;
    } else if (currentTheme == 'dark') {
      return ThemeMode.dark;
    } else
      return ThemeMode.system;
  }

  void changeTheme(String theme) {
    prefs.setString('theme', theme);
    currentTheme = theme;
    notifyListeners();
  }

  void getTheme() {
    currentTheme = prefs.getString('theme') ?? 'system';
    notifyListeners();
  }
}
