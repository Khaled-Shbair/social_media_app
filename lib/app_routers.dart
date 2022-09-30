import 'package:flutter/material.dart';
import 'constants/routers.dart';
import 'screens/app_layout.dart';
import 'screens/register.dart';
import 'screens/settings.dart';
import 'screens/chats.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/users.dart';

class AppRouters {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chats:
        return MaterialPageRoute(builder: (context) => const Chats());
      case users:
        return MaterialPageRoute(builder: (context) => const Users());
      case home:
        return MaterialPageRoute(builder: (context) => const Home());
      case login:
        return MaterialPageRoute(builder: (context) => const Login());
      case setting:
        return MaterialPageRoute(builder: (context) => const Settings());
      case register:
        return MaterialPageRoute(builder: (context) => const Register());
      case appLayout:
        return MaterialPageRoute(builder: (context) => const AppLayout());
      default:
        return MaterialPageRoute(builder: (context) => const Login());
    }
  }
}
