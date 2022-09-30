import 'package:flutter/material.dart';
import 'screens/onBoarding.dart';
import 'constants/routers.dart';
import 'screens/login.dart';

class AppRouters {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoarding());
      case login:
        return MaterialPageRoute(builder: (context) => const Login());
      default:
        return MaterialPageRoute(builder: (context) => const OnBoarding());
    }
  }
}
