import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiztale/controller/question_controller.dart';
import 'package:quiztale/routes/routes.dart';
import 'package:quiztale/utils/constants/sizes.dart';
import '../widgets/app_primary_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!_formkey.currentState!.validate()) return;
    _formkey.currentState!.save();
    Get.offAndToNamed(Routes.gamesScreenRoute);
    Get.find<QuestionController>().startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome to',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'QuizTale',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 192, 146, 8)),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSectionsLg,
            ),
            const Text(
              'Choose Username',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            Form(
                key: _formkey,
                child: GetBuilder<QuestionController>(
                  init: Get.find<QuestionController>(),
                  builder: (controller) => TextFormField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'Name should not be empty';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      controller.name = newValue!.trim().toUpperCase();
                    },
                    onFieldSubmitted: (value) => _submit(context),
                  ),
                )),
            const SizedBox(
              height: AppSizes.spaceBtwSectionsMd,
            ),
            AppPrimaryButton(
              buttonText: "Let's start >>>",
              buttonColor: const Color.fromARGB(255, 192, 146, 8),
              textColor: Colors.white,
              onTap: () {
                print('tapping');
                _submit(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
