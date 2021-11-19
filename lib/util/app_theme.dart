import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppThemeConfig {
  static const String FA_PRIMARY_FONT = "Iransanse";
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondryTextColor;
  final Color surfaceColor;
  final Color backGroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondryTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backGroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0x0d000000),
        backGroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme(String langugeCode) {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: primaryColor,
      brightness: brightness,
      dividerColor: surfaceColor,
      scaffoldBackgroundColor: backGroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: appBarColor,
        foregroundColor: primaryTextColor,
      ),
      textTheme: langugeCode == 'en' ? enPrimaryFont : faPrimaryFont,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: surfaceColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink.shade300)),
      ),
    );
  }

  TextTheme get enPrimaryFont => GoogleFonts.latoTextTheme(
        TextTheme(
          bodyText2: TextStyle(fontSize: 15, color: primaryTextColor),
          bodyText1: TextStyle(fontSize: 13, color: secondryTextColor),
          headline6: TextStyle(
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
          ),
          subtitle1: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
        ),
      );

  TextTheme get faPrimaryFont => TextTheme(
        bodyText2: TextStyle(
            fontSize: 13, color: primaryTextColor, fontFamily: FA_PRIMARY_FONT),
        bodyText1: TextStyle(
            fontSize: 12,
            color: secondryTextColor,
            fontFamily: FA_PRIMARY_FONT),
        caption: TextStyle(
          fontSize: 10,
          fontFamily: FA_PRIMARY_FONT,
        ),
        headline6: TextStyle(
            fontWeight: FontWeight.w200,
            color: primaryTextColor,
            fontFamily: FA_PRIMARY_FONT),
        subtitle1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: primaryColor,
            fontFamily: FA_PRIMARY_FONT),
      );
}
