import 'package:flutter/material.dart';

import 'package:boilerplate/ui/widgets/login.dart';

class Routes {
  Routes._();

  static const String login = '/login';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => Login(),
  };
}
