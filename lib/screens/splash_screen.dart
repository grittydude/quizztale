import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiztale/utils/constants/text.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset(AppImages.splashImage),
            FlutterLogo(size: 100),
            SizedBox(
              height: 20,
            ),
            Text(
              appName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
