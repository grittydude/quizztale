import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiztale/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizzTale',
      home: SplashScreen(),
    );
  }
}