import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class AdventureTravelIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdventureTravelIndexController>(() => AdventureTravelIndexController());
    Get.lazyPut<AdventureTravelIndexProvider>(() => AdventureTravelIndexProvider());
  }
}