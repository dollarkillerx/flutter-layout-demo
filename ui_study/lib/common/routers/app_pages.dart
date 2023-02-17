import 'package:get/get.dart';
import 'package:ui_study/app/adventure_travel_app/pages/detail/binding.dart';
import 'package:ui_study/app/adventure_travel_app/pages/detail/index.dart';
import 'package:ui_study/app/adventure_travel_app/pages/index/binding.dart';
import 'package:ui_study/app/house_rent_app/pages/index/binding.dart';
import 'package:ui_study/app/house_rent_app/pages/index/index.dart';
import 'package:ui_study/app/travel_app/pages/detial/binding.dart';
import 'package:ui_study/app/travel_app/pages/detial/index.dart';
import 'package:ui_study/common/routers/app_routes.dart';
import 'package:ui_study/components/r404.dart';
import 'package:ui_study/pages/home/binding.dart';
import 'package:ui_study/pages/home/index.dart';

import '../../app/adventure_travel_app/pages/index/index.dart';
import '../../app/house_rent_app/pages/detail/binding.dart';
import '../../app/house_rent_app/pages/detail/index.dart';
import '../../app/travel_app/pages/home/binding.dart';
import '../../app/travel_app/pages/home/index.dart';

class AppPages {
  static const InitRoute = AppRoutes.Home;

  static final routers = [
    // 主页导航
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

    // 案例1: Travel App
    GetPage(
        name: AppRoutes.Travel,
        page: () => TravelHomePage(),
        binding: TravelHomeBinding(),
        children: <GetPage>[
          GetPage(
            name: AppRoutes.Detail,
            page: () => TravelDetialPage(),
            binding: TravelDetialBinding(),
          )
        ]),

    // 案例2: Travel App
    GetPage(
        name: AppRoutes.HouseRent,
        page: () => HouseRentIndexPage(),
        binding: HouseRentIndexBinding(),
        children: <GetPage>[
          GetPage(
            name: AppRoutes.Detail,
            page: () => HouseRentDetailPage(),
            binding: HouseRentDetialBinding(),
          )
        ]),

    // 案例3: Adventure Travel App
    GetPage(
        name: AppRoutes.AdventureTravel,
        page: () => AdventureTravelIndexPage(),
        binding: AdventureTravelIndexBinding(),
        children: <GetPage>[
          GetPage(
            name: AppRoutes.Detail,
            page: () => AdventureTravelDetailPage(),
            binding: AdventureTravelDetailBinding(),
          )
        ]),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => R404(),
  );
}
