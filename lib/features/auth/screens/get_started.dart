import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:yumster/core/common/widget/button.dart';
import 'package:yumster/core/constants/constants.dart';
import 'package:yumster/core/constants/screen_constants.dart';
import 'package:yumster/core/themes/palette.dart';
import 'package:yumster/data/providers/stepper_provider.dart';

class GetStartedScreen extends ConsumerStatefulWidget {
  const GetStartedScreen({super.key});

  @override
  ConsumerState<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends ConsumerState<GetStartedScreen> {
  _navigateToSignInScreen() {
    context.goNamed('login');
  }

  _navigateToSignUpScreen() {
    ref.read(stepperProvider.notifier).state = 1;
    context.goNamed('signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.accentColor,
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 4,
            child: Lottie.asset(
              Constants.getStartedLottiePath,
              height: 500,
              repeat: false,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  Text(
                    ScreenConstants.gettingStartedScreenConstants['title']!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ScreenConstants.gettingStartedScreenConstants['subtitle']!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    label: ScreenConstants
                        .gettingStartedScreenConstants['buttonText']!,
                    onPressed: _navigateToSignUpScreen,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ScreenConstants
                            .gettingStartedScreenConstants['signInhelpText']!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: _navigateToSignInScreen,
                        child: Text(
                          ScreenConstants
                              .gettingStartedScreenConstants['signInCta']!,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
