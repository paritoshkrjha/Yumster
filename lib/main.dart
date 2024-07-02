import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/themes/themes.dart';
import 'package:yumster/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Yumster',
        themeMode: ThemeMode.system,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
      ),
    );
  }
}
