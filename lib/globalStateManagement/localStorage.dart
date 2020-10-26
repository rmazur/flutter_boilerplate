import 'package:boilerplate/localStorage/localStorageExample.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

final localStoreNotifProv =
    ChangeNotifierProvider<LocalStorageEx>((ref) => LocalStorageEx());

class LocalStorageEx extends ChangeNotifier {
  String _localStorageAuthor = '';
  String get localStorageAuthor => _localStorageAuthor;

  void getlocalAuthor() {
    _localStorageAuthor = LocalStorageExample().getAuthor();
    notifyListeners();
  }

  void setlocalAuthor(aName) {
    LocalStorageExample().setAuthor(aName);
    notifyListeners();
  }
}
