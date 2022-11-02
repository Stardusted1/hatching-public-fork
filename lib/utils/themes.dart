import 'package:flutter/material.dart';
import 'package:hatching/utils/fonts.dart';

extension AppThemes on ThemeData {
  static ThemeData getLightTheme(BuildContext context) {
    return ThemeData(
      dividerColor: Colors.transparent,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      primarySwatch: Colors.lightGreen,
      scaffoldBackgroundColor: Colors.green[50],
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: Colors.lightGreen,
        backgroundColor: Colors.green[50],
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.green[50],
        selectedItemColor: Colors.black,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 25,
        ),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            decorationColor: Colors.black,
            fontFamily: AppFonts.fontFamily,
          ),
      brightness: Brightness.light,
    );
  }

  static ThemeData getDarkTheme(BuildContext context) {
    return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.green[50],
        selectedItemColor: Colors.black,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 25,
        ),
      ),
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor: Colors.grey,
      brightness: Brightness.dark,
    );
  }
}
