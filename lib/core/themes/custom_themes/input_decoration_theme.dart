import 'package:flutter/material.dart';
import 'package:yumster/core/themes/palette.dart';

class CustomInputDecorationTheme {
  CustomInputDecorationTheme._();

  static InputDecorationTheme lightTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade200,
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Palette.accentColor,
        width: 1.0,
      ),
    ),
  );
  static InputDecorationTheme darkTheme = InputDecorationTheme(
    filled: true,
    prefixIconColor: Colors.white,
    fillColor: Colors.grey.shade700,
    hintStyle: const TextStyle(color: Colors.white70),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Palette.accentColor,
        width: 1.0,
      ),
    ),
  );
}
