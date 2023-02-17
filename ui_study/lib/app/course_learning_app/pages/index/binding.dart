import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class CourseLearningIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseLearningIndexController>(() => CourseLearningIndexController());
    Get.lazyPut<CourseLearningIndexProvider>(() => CourseLearningIndexProvider());
  }
}