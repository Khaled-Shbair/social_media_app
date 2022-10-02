import 'shared_preferences/pref_controller.dart';
import 'package:flutter/material.dart';
import 'screens/app_layout.dart';
import 'constants/routers.dart';
import 'screens/register.dart';
import 'screens/settings.dart';
import 'screens/chats.dart';
import 'screens/login.dart';
import 'screens/users.dart';
import 'screens/home.dart';

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
        if (PrefController.login) {
          return MaterialPageRoute(builder: (context) => const AppLayout());
        } else {
          return MaterialPageRoute(builder: (context) => const Login());
        }
    }
  }
}
