// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumster/core/local/device_storage.dart';
import 'package:yumster/data/providers/user_provider.dart';
import 'package:yumster/data/repository/splash_repository.dart';

class SplashController {
  handleTokenAvailability({
    required Function() navigateToHome,
    required Function() navigateToGetStarted,
    required WidgetRef ref,
  }) async {
    // check if token is available
    String? tokenAvailable = await DeviceStorage().read(key: 'token');

    if (tokenAvailable != null) {
      print('Token available: $tokenAvailable');
      final response =
          await SplashRepository().validateToken(token: tokenAvailable);
      response.fold((l) {
        print(l.message);
        navigateToGetStarted();
      }, (r) {
        print('Token is valid');
        ref.read(userProvider.notifier).updateUser(r!);
        navigateToHome();
      });
    } else {
      print('Token not available');
      navigateToGetStarted();
    }
  }
}
