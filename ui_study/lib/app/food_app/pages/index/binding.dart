import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class FoodIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodIndexController>(() => FoodIndexController());
    Get.lazyPut<FoodIndexProvider>(() => FoodIndexProvider());
  }
}