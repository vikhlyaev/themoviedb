import 'package:flutter/material.dart';
import 'package:themoviedb/theme/user_colors.dart';

class AppTheme {
  // final _darkPlainTextTheme = TextTheme().darkPlainText;

  ThemeData get dark {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        // filled: true,
        // fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: UserColors.lightGreyColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: UserColors.accentColor,
            width: 1.0,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
          foregroundColor: MaterialStateProperty.all(UserColors.accentColor),
          overlayColor: MaterialStateProperty.all(UserColors.lightAccentColor),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
          foregroundColor: MaterialStateProperty.all(UserColors.accentColor),
          overlayColor: MaterialStateProperty.all(UserColors.lightAccentColor),
          side: MaterialStateProperty.all(BorderSide(
            color: UserColors.lightGreyColor,
            width: 1,
          )),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(UserColors.accentColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(UserColors.darkAccentColor),
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}