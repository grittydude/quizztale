import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiztale/bindings/bindings.dart';
import 'package:quiztale/routes/routes.dart';
import 'package:quiztale/screens/game_screen.dart';
import 'package:quiztale/screens/game_status.dart';
import 'package:quiztale/screens/splash_screen.dart';
import 'package:quiztale/screens/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizzTale',
      initialBinding: MyBindings(),
      getPages: [
        GetPage(name: Routes.welcomeScreenRoute, page: () => const WelcomeScreen()),
        GetPage(name: Routes.gamesStatusRoute, page: () => const GameStatus()),
        GetPage(name: Routes.gamesScreenRoute, page: () => const GameScreen()),
      ],
      home: const SplashScreen(),
    );
  }
}