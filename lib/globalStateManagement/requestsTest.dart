import 'package:boilerplate/requests/requests.dart';
import 'package:flutter/material.dart';

class RequestsTest with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  void fetchData() {
    var tempData = DemoRequests().requestTest();
    tempData.then((value) {
      _data = value;
      notifyListeners();
    });
  }
}
