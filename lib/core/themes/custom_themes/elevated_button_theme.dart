import 'package:flutter/material.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  static ElevatedButtonThemeData ligthTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 1,
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 18)),
  );
  static ElevatedButtonThemeData darkTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      minimumSize: const Size(double.infinity, 50),
      backgroundColor: Colors.grey.shade800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 18),
    ),
  );
}
