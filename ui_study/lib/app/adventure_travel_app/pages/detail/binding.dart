import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class AdventureTravelDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdventureTravelDetailController>(
        () => AdventureTravelDetailController());
    Get.lazyPut<AdventureTravelDetailProvider>(
        () => AdventureTravelDetailProvider());
  }
}
