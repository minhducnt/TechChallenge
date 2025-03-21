import 'package:get/get.dart';

import '../controllers/bar_chart_controller.dart';

class BarChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarChartController>(
      () => BarChartController(),
    );
  }
}
