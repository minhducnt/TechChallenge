import 'package:get/get.dart';

import 'package:sof_tracker/app/modules/home/bar_chart/controllers/bar_chart_controller.dart';
import 'package:sof_tracker/app/modules/home/line_chart/controllers/line_chart_controller.dart';

import '../controllers/homepage_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<HomepageController>(() => HomepageController())
      ..lazyPut<LineChartController>(() => LineChartController())
      ..lazyPut<BarChartController>(() => BarChartController());
  }
}
