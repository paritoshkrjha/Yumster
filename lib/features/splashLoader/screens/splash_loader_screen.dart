import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yumster/core/common/widget/loader.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/core/utils.dart';
import 'package:yumster/features/splashLoader/controller/splash_controller.dart';

class Splashloaderscreen extends StatefulWidget {
  const Splashloaderscreen({super.key});

  @override
  State<Splashloaderscreen> createState() => _SplashloaderscreenState();
}

class _SplashloaderscreenState extends State<Splashloaderscreen> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    await Utils().addDelay(2);
    SplashController().handleTokenAvailabity(
      navigateToHome: () => context.goNamed('home'),
      navigateToGetStarted: () => context.goNamed('getStarted'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.accentColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Yumster',
            style: GoogleFonts.dancingScript().copyWith(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          const CustomLoader(),
        ],
      ),
    );
  }
}
