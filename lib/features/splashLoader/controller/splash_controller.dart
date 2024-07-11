import 'package:yumster/core/local/device_storage.dart';
import 'package:yumster/data/repository/splash_repository.dart';

class SplashController {
  handleTokenAvailability({
    required Function() navigateToHome,
    required Function() navigateToGetStarted,
  }) async {
    // check if token is available
    String? tokenAvailable = await DeviceStorage().read(key: 'token');

    if (tokenAvailable != null) {
      print('Token available: $tokenAvailable');
      final response =
          await SplashRepository().validateToken(token: tokenAvailable);
      response.fold((l) {
        print('Token is invalid');
        navigateToGetStarted();
      }, (r) {
        print('Token is valid');
        navigateToHome();
      });
    } else {
      print('Token not available');
      navigateToGetStarted();
    }
  }
}
