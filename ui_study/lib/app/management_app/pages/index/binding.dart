import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class ManagementIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagementIndexController>(() => ManagementIndexController());
    Get.lazyPut<ManagementIndexProvider>(() => ManagementIndexProvider());
  }
}