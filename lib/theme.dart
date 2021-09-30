import 'package:cmail/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: lightRed,
    scaffoldBackgroundColor: bgColorLight,
    accentColor: drawerOptionBgLight,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: bgColorLight,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: textColorLight),
    ),
    iconTheme: IconThemeData(color: textColorLight),
    textTheme: TextTheme(
      headline3: TextStyle(
        color: darkRed,
        fontSize: 20,
        fontFamily: "Product Sans",
      ),
      headline4: TextStyle(
        color: subjectColorLight,
        fontSize: 20,
        fontFamily: "Product Sans",
        height: 1.5,
      ),
      headline5: TextStyle(
        color: textColorLight,
        fontSize: 18,
        fontFamily: "Product Sans",
      ),
      headline6: TextStyle(
        color: textColorLight,
        fontSize: 16,
        fontFamily: "Product Sans",
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
        color: textColorLight,
        fontSize: 14,
      ),
      subtitle2: TextStyle(
        color: textColorLight,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(
        letterSpacing: 0.5,
        color: darkRed,
        fontSize: 15,
        fontFamily: "Product Sans",
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: darkRed,
      primaryVariant: blue,
      secondary: textColorLight,
      secondaryVariant: green,
      error: darkRed,
      onBackground: appbarBorderLight,
      surface: bgColorLight,
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 2.5,
      color: Colors.white,
      textStyle: TextStyle(
        color: subjectColorLight,
        fontSize: 16,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: bgColorLight,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: darkRed,
      unselectedItemColor: textColorLight,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: darkRed,
    scaffoldBackgroundColor: bgColorDark,
    accentColor: drawerOptionBgDark,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: appbarBgDark,
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: textColorDark),
    ),
    iconTheme: IconThemeData(color: textColorDark),
    textTheme: TextTheme(
      headline3: TextStyle(
        color: subjectColorDark,
        fontSize: 20,
        fontFamily: "Product Sans",
      ),
      headline4: TextStyle(
        color: subjectColorDark,
        fontSize: 20,
        fontFamily: "Product Sans",
        height: 1.5,
      ),
      headline5: TextStyle(
        color: textColorDark,
        fontSize: 18,
        fontFamily: "Product Sans",
      ),
      headline6: TextStyle(
        color: textColorDark,
        fontSize: 16,
        fontFamily: "Product Sans",
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
        color: textColorDark,
        fontSize: 14,
      ),
      subtitle2: TextStyle(
        color: textColorDark,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(
        letterSpacing: 0.5,
        color: lightRed,
        fontSize: 15,
        fontFamily: "Product Sans",
      ),
    ),
    colorScheme: ColorScheme.dark().copyWith(
      primary: darkRed,
      primaryVariant: blue,
      secondary: textColorDark,
      secondaryVariant: green,
      error: lightRed,
      onBackground: Colors.transparent,
      surface: bgColorDark,
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 2.5,
      color: appbarBgDark,
      textStyle: TextStyle(
        color: subjectColorDark,
        fontSize: 16,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appbarBgDark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appbarBgDark,
      selectedItemColor: lightRed,
      unselectedItemColor: textColorDark,
    ),
  );
}

// final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
