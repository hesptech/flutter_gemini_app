import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const seedColor = Color(0xFF1E1C36);

class AppTheme {

  final bool isDarkMode;

  AppTheme({required this.isDarkMode} );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
     appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1E1C36),
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
    ),
  );

  static setSystemUIOverlayStyle({required bool isDarkMode}) {
    final themBrightness = isDarkMode ? Brightness.dark : Brightness.light;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: themBrightness,
        statusBarIconBrightness: themBrightness,
        systemNavigationBarIconBrightness: themBrightness,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

}