import 'package:get/get.dart';

import 'package:sof_tracker/app/modules/home/bookmark/controllers/bookmark_controller.dart';
import 'package:sof_tracker/app/modules/home/chart/controllers/chart_controller.dart';
import 'package:sof_tracker/app/modules/home/dashboard/controllers/dashboard_controller.dart';

import '../controllers/homepage_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<HomepageController>(() => HomepageController())
      ..lazyPut<DashboardController>(() => DashboardController())
      ..lazyPut<BookmarkController>(() => BookmarkController())
      ..lazyPut<ChartController>(() => ChartController());
  }
}
