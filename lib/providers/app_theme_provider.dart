import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeData themeData;

  AppThemeProvider({required bool esModoOscuro})
      : themeData = esModoOscuro ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    themeData = ThemeData.light();
    notifyListeners();
  }
  
  setDarkMode() {
    themeData = ThemeData.dark();
    notifyListeners();
  }
}
