import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  CustomTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.raleway().copyWith(
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.raleway().copyWith(
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.raleway().copyWith(
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.raleway().copyWith(
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.raleway().copyWith(
      color: Colors.black,
    ),
    titleSmall: GoogleFonts.raleway().copyWith(
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.raleway().copyWith(
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.raleway().copyWith(
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.raleway().copyWith(
      color: Colors.black.withOpacity(0.5),
    ),
    labelLarge: GoogleFonts.raleway().copyWith(
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.raleway().copyWith(
      color: Colors.black.withOpacity(0.5),
    ),
  );
  static TextTheme darkTextTheme = const TextTheme().copyWith(
    headlineLarge: GoogleFonts.raleway().copyWith(
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.raleway().copyWith(
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.raleway().copyWith(
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.raleway().copyWith(
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.raleway().copyWith(
      color: Colors.white,
    ),
    titleSmall: GoogleFonts.raleway().copyWith(
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.raleway().copyWith(
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.raleway().copyWith(
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.raleway().copyWith(
      color: Colors.white.withOpacity(0.5),
    ),
    labelLarge: GoogleFonts.raleway().copyWith(
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.raleway().copyWith(
      color: Colors.white.withOpacity(0.5),
    ),
  );
}
