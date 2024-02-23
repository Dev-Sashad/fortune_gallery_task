import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fortune_gallery/constants/_constant.dart';

class AppTheme {
  AppTheme._();

  /// The app was designed in a light theme mode so, there's no dark theme data
  /// for now
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      primaryContainer: AppColors.primaryColor,
      secondary: AppColors.purpleColor,
      background: AppColors.white,
      onBackground: AppColors.white,
      onSurface: AppColors.textGrey,
      onPrimary: AppColors.white,
      surface: AppColors.white, // background color of the date picker
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
    ),
    highlightColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(color: AppColors.black),
    fontFamily: GoogleFonts.montserratTextTheme().bodyLarge!.fontFamily,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 38.sp,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 28.sp,
        color: AppColors.textGrey,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textGrey,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textGrey,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.textGrey,
      ),
    ),
    buttonTheme:
        const ButtonThemeData(buttonColor: AppColors.primaryColor, height: 58),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.white,
      secondary: AppColors.black,
      background: AppColors.primaryColor,
      onBackground: AppColors.primaryColor,
      surface: AppColors.primaryColor,
      onSurface: AppColors.textGrey,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.white,
    highlightColor: AppColors.white,
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all(AppColors.white),
    ),
    iconTheme: const IconThemeData(color: AppColors.white),
    fontFamily: GoogleFonts.montserratTextTheme().bodyLarge!.fontFamily,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 38.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 28.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.white,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.white,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.white,
      ),
    ),
    buttonTheme: const ButtonThemeData(
        // buttonColor: AppColors.primaryColor,
        height: 58),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
