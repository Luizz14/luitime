import 'package:flutter/material.dart';
import 'package:luitime/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.pumpkin500,
      onPrimary: Colors.white,
      surface: AppColors.westar50,
      onSurface: AppColors.flint800,
      surfaceContainer: AppColors.westar100,
      surfaceTint: AppColors.westar200,
      outline: AppColors.flint500,
      outlineVariant: AppColors.flint400,
    ),
    scaffoldBackgroundColor: AppColors.westar50,
    textTheme: GoogleFonts.istokWebTextTheme(),
    primaryTextTheme: GoogleFonts.nunitoTextTheme(),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.pumpkin500,
      onPrimary: Colors.white,
      surface: AppColors.flint950,
      onSurface: AppColors.flint100,
      surfaceContainer: AppColors.flint900,
      surfaceTint: AppColors.flint800,
      outline: AppColors.flint300,
      outlineVariant: AppColors.flint400,
    ),
    scaffoldBackgroundColor: AppColors.flint950,
    textTheme: GoogleFonts.istokWebTextTheme(),
    primaryTextTheme: GoogleFonts.nunitoTextTheme(),
  );

  // Amoled Theme
  static ThemeData amoled = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.pumpkin500,
      onPrimary: Colors.white,
      surface: Colors.black,
      onSurface: AppColors.flint100,
      surfaceContainer: AppColors.flint950,
      surfaceTint: AppColors.flint900,
      outline: AppColors.flint300,
      outlineVariant: AppColors.flint400,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: GoogleFonts.istokWebTextTheme(),
    primaryTextTheme: GoogleFonts.nunitoTextTheme(),
  );
}
