import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/* class LanguageProvider with ChangeNotifier {
  Locale _currentLanguage = Locale('en');
  Locale get language => _currentLanguage;

  void changeLanguage() {
    _currentLanguage =
        _currentLanguage == Locale('en') ? Locale('es') : Locale('en');
    notifyListeners();
  }
} */

final changeLanguageNotifProv =
    ChangeNotifierProvider<LanguageProvider>((ref) => LanguageProvider());

class LanguageProvider extends ChangeNotifier {
  Locale _currentLanguage = Locale('en');
  Locale get language => _currentLanguage;

  void changeLanguage() {
    _currentLanguage =
        _currentLanguage == Locale('en') ? Locale('es') : Locale('en');
    notifyListeners();
  }
}
