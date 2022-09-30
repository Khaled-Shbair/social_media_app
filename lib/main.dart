import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'language/translation.dart';
import 'package:get/get.dart';
import 'app_routers.dart';

void main() async {
  await Firebase.initializeApp();
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
      //locale: Locale(PrefController().language),
      locale: Locale('en'),
      fallbackLocale: const Locale('en'),
      onGenerateRoute: appRouters.onGenerateRoute,
      //theme: ThemeModeApp.lightTheme,
      //darkTheme: ThemeModeApp.darkTheme,
      //themeMode: ThemeModeApp.getThemeMode(),
    );
  }
}
