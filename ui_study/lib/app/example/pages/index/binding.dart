import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class HouseRentIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HouseRentIndexController>(() => HouseRentIndexController());
    Get.lazyPut<HouseRentIndexProvider>(() => HouseRentIndexProvider());
  }
}