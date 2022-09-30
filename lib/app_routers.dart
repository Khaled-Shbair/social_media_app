import 'package:flutter/material.dart';
import 'constants/routers.dart';
import 'screens/register.dart';
import 'screens/login.dart';

class AppRouters {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => const Login());
      case register:
        return MaterialPageRoute(builder: (context) => const Register());
      default:
        return MaterialPageRoute(builder: (context) => const Login());
    }
  }
}
