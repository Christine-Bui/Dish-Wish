import 'package:flutter/material.dart';

class AppSettingsModel with ChangeNotifier {
  double _textSize = 16.0;
  bool _darkMode = false;

  double get textSize => _textSize;
  bool get darkMode => _darkMode;

  void setTextSize(double newSize) {
    _textSize = newSize;
    notifyListeners();
  }

  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}
