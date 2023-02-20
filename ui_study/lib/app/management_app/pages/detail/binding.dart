import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class ManagementDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagementDetailController>(() => ManagementDetailController());
    Get.lazyPut<ManagementDetailProvider>(() => ManagementDetailProvider());
  }
}