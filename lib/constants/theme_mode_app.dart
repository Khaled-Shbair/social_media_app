import 'package:flutter/material.dart';
import 'colors_app.dart';

class ThemeModeApp {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: ColorsApp.green,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorsApp.green,
      ),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: ColorsApp.green,
        fontSize: 24,
      ),
    ),
  );
}
