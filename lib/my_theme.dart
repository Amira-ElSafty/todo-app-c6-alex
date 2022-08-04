import 'package:flutter/material.dart';

class MyThemeData{
  static Color primaryBlue = Color(0xFF5D9CEC);
  static Color green = Color(0xFF61E757);
  static Color red = Color(0xFFEC4B4B);
  static Color white = Color(0xFFFFFFFF);
  static Color black = Color(0xFF383838);
  static Color background = Color(0xFFDFECDB);


  static ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      color: primaryBlue,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: white
      )
    ),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, color: white, fontWeight: FontWeight.w700),
          subtitle1: TextStyle(
              fontSize: 20, color: primaryBlue, fontWeight: FontWeight.w400),
          bodyText1: TextStyle(
              fontSize: 12,
              color: black
          ),
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryBlue,
      unselectedItemColor: white,
    ),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent,
  ),

  );

}