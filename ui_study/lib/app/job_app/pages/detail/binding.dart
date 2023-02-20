import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class JobDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobDetailController>(() => JobDetailController());
    Get.lazyPut<JobDetailProvider>(() => JobDetailProvider());
  }
}