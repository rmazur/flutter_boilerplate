import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:boilerplate/ui/themes.dart';

/* class ThemeManagement with ChangeNotifier {
  ThemeData _currentTheme = mainTheme;
  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == mainTheme ? secondaryTheme : mainTheme;
    notifyListeners();
  }
} */

final changeThemeNotifProv =
    ChangeNotifierProvider<ThemeManagement>((ref) => ThemeManagement());

class ThemeManagement extends ChangeNotifier {
  ThemeData _currentTheme = mainTheme;
  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == mainTheme ? secondaryTheme : mainTheme;
    notifyListeners();
  }
}
