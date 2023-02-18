import 'package:get/get.dart';
import 'provider.dart';
import 'controller.dart';

class MessagingDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagingDetailController>(() => MessagingDetailController());
    Get.lazyPut<MessagingDetailProvider>(() => MessagingDetailProvider());
  }
}