import 'package:firebase_core/firebase_core.dart';
import 'constants/theme_mode_app.dart';
import 'shared_preferences/pref_controller.dart';
import 'package:flutter/material.dart';
import 'language/translation.dart';
import 'package:get/get.dart';
import 'app_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PrefController.init();
  runApp(MyApp(appRouters: AppRouters()));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appRouters, super.key});

  final AppRouters appRouters;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: Locale(PrefController().language),
      fallbackLocale: const Locale('en'),
      onGenerateRoute: appRouters.onGenerateRoute,
      theme: ThemeModeApp.lightTheme,
    );
  }
}
