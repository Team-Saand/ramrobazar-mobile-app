import 'package:flutter/material.dart';

import '../../config/constants/theme_constant.dart';

class AppTheme {
  AppTheme._();

  static getApplicationTheme(bool isDark) {
    return ThemeData(
      colorScheme: isDark
          ? const ColorScheme.dark(
              primary: Colors.black, // Text color in buttons
              secondary: Colors.black, //Selected nav bar
              background: Colors.black, //Scaffold background
              surface:
                  Color.fromRGBO(255, 255, 255, 1), //Drawer Side bar & button
              onPrimary: ThemeConstant.secondaryColor, //Switch color
              onBackground: Colors.white, // Surrounding border of text fields
              onSurface: ThemeConstant.textColor, // Text color in scaffold
            )
          : const ColorScheme.light(
              primary: ThemeConstant.textColor, // Text color in buttons
              secondary: ThemeConstant.secondaryColor, //Selected nav bar
              background: ThemeConstant.backgroundColor, //Scaffold background
              surface: ThemeConstant.secondaryColor, //Drawer Side bar  & button
              onPrimary: ThemeConstant.secondaryColor, //Switch color
              onBackground: Colors.black, // Surrounding border of text fields
              onSurface: ThemeConstant
                  .textColor, // Text color in scaffold //Icon color in text field
            ),
      brightness: isDark ? Brightness.dark : Brightness.light,
      fontFamily: 'Comfortaa',
      useMaterial3: true,

      textSelectionTheme: TextSelectionThemeData(
        cursorColor:
            isDark ? ThemeConstant.secondaryColor : ThemeConstant.primaryColor,
        selectionColor:
            isDark ? ThemeConstant.secondaryColor : ThemeConstant.primaryColor,
        selectionHandleColor:
            isDark ? ThemeConstant.secondaryColor : ThemeConstant.primaryColor,
      ),
      cardColor:
          isDark ? ThemeConstant.secondaryColor : ThemeConstant.primaryColor,
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: isDark
              ? ThemeConstant.secondaryColor
              : ThemeConstant.primaryColor,
          centerTitle: true,
          titleTextStyle: const TextStyle(fontSize: 20)),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            isDark ? ThemeConstant.secondaryColor : ThemeConstant.primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: isDark ? Colors.black : Colors.white,
      ),
      // Change text field theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(15),
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(
          color: isDark
              ? ThemeConstant.secondaryColor
              : ThemeConstant.primaryColor,
          fontSize: 13,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDark
                ? ThemeConstant.secondaryColor
                : ThemeConstant.primaryColor,
          ),
        ),
      ),
      // Circular progress bar theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: isDark
              ? ThemeConstant.secondaryColor
              : ThemeConstant.primaryColor),

      snackBarTheme: SnackBarThemeData(
        backgroundColor:
            isDark ? ThemeConstant.secondaryColor : ThemeConstant.primaryColor,
        contentTextStyle: const TextStyle(
          fontSize: 16,
        ),
      ),

      textTheme: const TextTheme(
        displaySmall: TextStyle(color: ThemeConstant.textColor),
        displayMedium: TextStyle(color: ThemeConstant.textColor),
        displayLarge: TextStyle(color: ThemeConstant.textColor),
        titleLarge: TextStyle(color: ThemeConstant.textColor),
        titleMedium: TextStyle(color: ThemeConstant.textColor),
        titleSmall: TextStyle(color: ThemeConstant.textColor),
        bodyLarge: TextStyle(color: ThemeConstant.textColor),
        bodyMedium: TextStyle(color: ThemeConstant.textColor),
        bodySmall: TextStyle(color: ThemeConstant.textColor),
        labelLarge: TextStyle(color: ThemeConstant.textColor),
        labelMedium: TextStyle(color: ThemeConstant.textColor),
        labelSmall: TextStyle(color: ThemeConstant.textColor),
        ),

      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(
            isDark ? ThemeConstant.secondaryColor : ThemeConstant.primaryColor),
      ),

      dialogTheme: DialogTheme(
        backgroundColor:
            isDark ? ThemeConstant.secondaryColor : ThemeConstant.primaryColor,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        contentTextStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
