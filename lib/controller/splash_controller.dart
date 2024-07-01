import 'package:get/get.dart';
import 'package:quiztale/screens/welcome_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigateToGame();
    super.onInit();
  }

  void navigateToGame() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.off(const WelcomeScreen());
      },
    );
  }
}
