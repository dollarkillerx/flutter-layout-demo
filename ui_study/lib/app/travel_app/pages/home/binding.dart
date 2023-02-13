import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class TravelHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelHomeController>(() => TravelHomeController());
    Get.lazyPut<TravelHomeProvider>(() => TravelHomeProvider());
  }
}