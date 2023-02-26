import 'package:get/get.dart';
import 'package:ui_study/app/food_app/model/model.dart';

class FoodDetailController extends GetxController {
  final FoodModel food = Get.arguments["food"];
}