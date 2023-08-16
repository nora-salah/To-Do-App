import 'package:todo_app/templets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getAppTheme() {
  return ThemeData(

    primaryColor: AppColors.Primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),
    textTheme: TextTheme(
        displayLarge:GoogleFonts.lato(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      displayMedium: GoogleFonts.lato(
        color: AppColors.white,
        fontSize: 16,
      ),
      displaySmall:  GoogleFonts.lato(
        color: AppColors.white.withOpacity(0.44),
        fontSize: 16,
      ),
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.Primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}

ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.red,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displayLarge:GoogleFonts.lato(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      displayMedium: GoogleFonts.lato(
        color: AppColors.white,
        fontSize: 16,
      ),
      displaySmall:  GoogleFonts.lato(
        color: AppColors.white.withOpacity(0.44),
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.Primary,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}

