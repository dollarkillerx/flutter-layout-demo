import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class FoodDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodDetailController>(() => FoodDetailController());
    Get.lazyPut<FoodDetailProvider>(() => FoodDetailProvider());
  }
}