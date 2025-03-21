import 'package:get/get.dart';

import '../data/di.dart';
import '../modules/home/bar_chart/bindings/bar_chart_binding.dart';
import '../modules/home/bar_chart/views/bar_chart_view.dart';
import '../modules/home/line_chart/bindings/line_chart_binding.dart';
import '../modules/home/line_chart/views/line_chart_view.dart';
import '../modules/home/homepage/bindings/homepage_binding.dart';
import '../modules/home/homepage/views/homepage_view.dart';
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
            name: _Paths.LINE_CHART,
            page: () => const LineChartView(),
            binding: LineChartBinding(),
          ),
          GetPage(
            name: _Paths.BAR_CHART,
            page: () => const BarChartView(),
            binding: BarChartBinding(),
          ),
        ]),
  ];
}
