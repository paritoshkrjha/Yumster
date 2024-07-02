import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yumster/core/themes/custom_themes/appbar_theme.dart';
import 'package:yumster/core/themes/custom_themes/elevated_button_theme.dart';
import 'package:yumster/core/themes/custom_themes/input_decoration_theme.dart';
import 'package:yumster/core/themes/custom_themes/text_theme.dart';

class AppThemes {
  AppThemes._();
  static final ThemeData lightTheme = ThemeData().copyWith(
    brightness: Brightness.light,
    primaryTextTheme: GoogleFonts.ralewayTextTheme(),
    scaffoldBackgroundColor: Colors.grey.shade100,
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.ligthTheme,
    inputDecorationTheme: CustomInputDecorationTheme.lightTheme,
    appBarTheme: CustomAppBarTheme.lightTheme,
  );
  static final ThemeData darkTheme = ThemeData().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade800,
    primaryTextTheme: GoogleFonts.ralewayTextTheme(),
    textTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkTheme,
    inputDecorationTheme: CustomInputDecorationTheme.darkTheme,
    appBarTheme: CustomAppBarTheme.darkTheme,
  );
}


// appBarTheme: AppBarTheme(color: Colors.grey.shade100, ),
//         scaffoldBackgroundColor: Colors.grey.shade100,
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           selectedLabelStyle: TextStyle(fontSize: 10),
//           unselectedLabelStyle: TextStyle(fontSize: 10),
//           backgroundColor: Colors.white,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           selectedItemColor: Colors.black87,
//         ),
//         textTheme: GoogleFonts.ralewayTextTheme(),
//         inputDecorationTheme: InputDecorationTheme(
//           prefixIconColor: Colors.grey,
//           fillColor: Colors.grey.shade200,
//           filled: true,
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: accentColor,
//               width: 1.5,
//             ),
//             borderRadius: BorderRadius.all(
//               Radius.circular(10),
//             ),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         tabBarTheme: const TabBarTheme(
//           labelPadding: EdgeInsets.all(10),
//           indicatorSize: TabBarIndicatorSize.tab,
//           indicator: UnderlineTabIndicator(
//               borderSide: BorderSide(width: 1, color: Colors.black45)),
//           labelColor: Colors.black87,
//           splashFactory: NoSplash.splashFactory,
//           unselectedLabelColor: Colors.grey,
//         )
//         ,