import 'package:flutter/material.dart';
import 'package:quiztale/utils/constants/colors.dart';
import 'package:quiztale/utils/constants/text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          appName,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: Colors.white),
        ),
      ),
      body: Center(),
    );
  }
}
