import 'package:get/get.dart';

import '../data/di.dart';
import '../modules/home/chart/bindings/chart_binding.dart';
import '../modules/home/chart/views/chart_view.dart';
import '../modules/home/bookmark/bindings/bookmark_binding.dart';
import '../modules/home/bookmark/views/bookmark_view.dart';
import '../modules/home/dashboard/bindings/dashboard_binding.dart';
import '../modules/home/dashboard/views/dashboard_view.dart';
import '../modules/home/homepage/bindings/homepage_binding.dart';
import '../modules/home/homepage/views/homepage_view.dart';
import '../modules/home/reputation/bindings/reputation_binding.dart';
import '../modules/home/reputation/views/reputation_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    //* Auth
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fade,
    ),

    //* Home
    GetPage(
        name: _Paths.HOMEPAGE,
        page: () => const HomepageView(),
        binding: HomepageBinding(),
        transition: Transition.fade,
        transitionDuration: $r.times.med,
        children: [
          GetPage(
            name: _Paths.DASHBOARD,
            page: () => const DashboardView(),
            binding: DashboardBinding(),
          ),
          GetPage(
            name: _Paths.BOOKMARK,
            page: () => const BookmarkView(),
            binding: BookmarkBinding(),
          ),
        ]),

    //* Main
    GetPage(
      name: _Paths.REPUTATION,
      page: () => const ReputationView(),
      binding: ReputationBinding(),
    ),
    GetPage(
      name: _Paths.CHART,
      page: () => const ChartView(),
      binding: ChartBinding(),
    ),
  ];
}
