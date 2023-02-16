import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class HouseRentDetialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HouseRentDetialController>(() => HouseRentDetialController());
    Get.lazyPut<HouseRentDetialProvider>(() => HouseRentDetialProvider());
  }
}