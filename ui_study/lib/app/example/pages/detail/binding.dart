import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class CourseLearningDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseLearningDetailController>(() => CourseLearningDetailController());
    Get.lazyPut<CourseLearningDetailProvider>(() => CourseLearningDetailProvider());
  }
}