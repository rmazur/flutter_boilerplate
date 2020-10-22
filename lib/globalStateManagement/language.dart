import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  Locale _currentLanguage = Locale('en');
  Locale get language => _currentLanguage;

  void changeLanguage() {
    _currentLanguage =
        _currentLanguage == Locale('en') ? Locale('es') : Locale('en');
    notifyListeners();
  }
}
