import 'package:flutter/material.dart';
import 'package:news_app/core/utilities/app_colors.dart';

class AppTheme {
  
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light ,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.black,
    
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.black),
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),

    iconTheme: IconThemeData(
      color: AppColors.black,
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.black, fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: AppColors.black, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.black, fontSize: 14),
    ),
  );


  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.white,
    
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
    ),

    iconTheme: IconThemeData(
      color: AppColors.white,
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(color: AppColors.white, fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: AppColors.white, fontSize: 18),
      bodyMedium: TextStyle(color: AppColors.white, fontSize: 14),
    ),
  );
}