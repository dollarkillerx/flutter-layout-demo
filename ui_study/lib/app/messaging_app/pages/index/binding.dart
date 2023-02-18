import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class MessagingIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagingIndexController>(() => MessagingIndexController());
    Get.lazyPut<MessagingIndexProvider>(() => MessagingIndexProvider());
  }
}