import 'package:get/get.dart';
import 'package:quiztale/controller/splash_controller.dart';

import '../controller/question_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionController());
    Get.lazyPut(() => SplashController());
  }
}
