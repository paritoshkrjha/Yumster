import 'package:flutter/material.dart';
import 'package:yumster/core/common/widget/loader.dart';
import 'package:yumster/core/constants/screen_constants.dart';
import 'package:yumster/core/themes/palette.dart';

class CustomLoadingPage extends StatelessWidget {
  final bool isLogin;
  const CustomLoadingPage({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.accentColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isLogin
                ? ScreenConstants.loginLoadingScreenConstants['title']!
                : ScreenConstants.signupLoadingScreenConstants['title']!,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            isLogin
                ? ScreenConstants.loginLoadingScreenConstants['subtitle']!
                : ScreenConstants.signupLoadingScreenConstants['subtitle']!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomLoader(color: Colors.white,),
        ],
      ),
    );
  }
}
