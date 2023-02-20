import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class JobIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobIndexController>(() => JobIndexController());
    Get.lazyPut<JobIndexProvider>(() => JobIndexProvider());
  }
}