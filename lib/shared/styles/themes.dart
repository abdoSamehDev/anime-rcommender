import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: defaultLightColor,
    appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      elevation: 0,
      // backwardsCompatibility: false,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      color: Colors.white,
      titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultLightColor,
        unselectedItemColor: Colors.grey[600],
        elevation: 20,
        backgroundColor: Colors.white
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 1.3,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 1.3,
      ),
    )
);

ThemeData darkTheme = ThemeData(
    primarySwatch: defaultDarkColor,
    appBarTheme: AppBarTheme(
      titleSpacing: 20,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xff121212),
          statusBarIconBrightness: Brightness.light
      ),
      elevation: 0,
      // backwardsCompatibility: false,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      color: Colors.grey[900],
      titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey[500],
      elevation: 20,
      backgroundColor: Colors.grey[900],
    ),
    scaffoldBackgroundColor: const Color(0xff121212),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(.87)
      ),
      bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.6)
      ),
    ),
  iconTheme: IconThemeData(
    color: Colors.grey[500]
  )
);