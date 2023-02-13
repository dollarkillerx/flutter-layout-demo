import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class TravelDetialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelDetialController>(() => TravelDetialController());
    Get.lazyPut<TravelDetialProvider>(() => TravelDetialProvider());
  }
}