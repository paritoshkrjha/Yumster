import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/common/stepper.dart';
import 'package:yumster/data/providers/page_view_controller_provider.dart';
import 'package:yumster/data/providers/stepper_provider.dart';
import 'package:yumster/features/auth/screens/sign_up/personal_details_screen.dart';
import 'package:yumster/features/auth/screens/sign_up/preference_details_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   alignment: Alignment.centerLeft,
            //   padding: const EdgeInsets.all(20),
            //   decoration: const BoxDecoration(color: Palette.accentColor),
            //   width: double.infinity,
            //   height: 150,
            //   child: RichText(
            //     text: TextSpan(
            //       children: [
            //         TextSpan(
            //           text: ScreenConstants.signUpScreenConstants['title']!,
            //           style:
            //               Theme.of(context).textTheme.headlineLarge!.copyWith(
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.white,
            //                   ),
            //         ),
            //         const TextSpan(text: '\n'),
            //         TextSpan(
            //           text: ScreenConstants.signUpScreenConstants['subtitle']!,
            //           style: Theme.of(context)
            //               .textTheme
            //               .bodyLarge!
            //               .copyWith(color: Colors.white),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Consumer(
              builder: (context, ref, child) {
                var activeStepper = ref.watch(stepperProvider);
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 20,
                  ),
                  child: CustomStepper(
                    steps: 2,
                    active: activeStepper,
                  ),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                var pageController = ref.watch(pageViewControllerProvider);
                return Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      PersonalDetailsScreen(),
                      PreferenceDetailsScreen()
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
