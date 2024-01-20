import 'package:flutter/material.dart';
import 'package:limon_chat_app/config/constant/themes/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = AppTheme.lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == AppTheme.darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == AppTheme.lightMode) {
      _themeData = AppTheme.darkMode;
    } else {
      _themeData = AppTheme.lightMode;
    }
    notifyListeners();
  }
}
