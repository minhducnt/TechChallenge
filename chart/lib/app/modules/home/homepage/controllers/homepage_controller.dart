import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/constants/enums/systems.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/utils/utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_controller.dart';
import 'package:sof_tracker/app/modules/home/bar_chart/controllers/bar_chart_controller.dart';
import 'package:sof_tracker/app/modules/home/bar_chart/views/bar_chart_view.dart';
import 'package:sof_tracker/app/modules/home/line_chart/controllers/line_chart_controller.dart';
import 'package:sof_tracker/app/modules/home/line_chart/views/line_chart_view.dart';

class HomepageController extends BaseController with GetTickerProviderStateMixin {
  //* Variables
  DateTime? lastBackPressedTime;
  RxInt currentTabIndex = 0.obs;
  final RxBool atBottom = false.obs;
  late PageController pageController;

  //* Lifecycle
  @override
  void onInit() {
    pageController = PageController(initialPage: currentTabIndex.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  //* Navigation
  final tabs = [
    HomeTabInfo(
      title: localeLang.barChart,
      icon: FluentIcons.data_bar_vertical_20_regular,
      selectedIcon: FluentIcons.data_bar_vertical_20_filled,
      iconSize: 20.sp,
      widget: BarChartView(),
    ),
    HomeTabInfo(
      title: localeLang.lineChart,
      icon: FluentIcons.data_trending_20_regular,
      selectedIcon: FluentIcons.data_trending_20_filled,
      iconSize: 20.sp,
      widget: const LineChartView(),
    ),
  ].obs;

  Future<void> onItemTapped(int index) async {
    currentTabIndex.value = index;
    pageController.jumpToPage(index);
    index == 0 ? Get.find<LineChartController>().refresh() : Get.find<BarChartController>().refresh();
    update();
  }

  Future<void> onItemSwipe(int index) async {
    currentTabIndex.value = index;
    await pageController.animateToPage(index, duration: $r.times.pageTransition, curve: Curves.easeInOut);
    index == 0 ? Get.find<LineChartController>().refresh() : Get.find<BarChartController>().refresh();
    update();
  }

  Future<void> onBackCalled(BuildContext context) async {
    final now = DateTime.now();

    if (lastBackPressedTime != null && now.difference(lastBackPressedTime!) <= $r.times.twoSeconds) {
      await SystemNavigator.pop(animated: true);
    }

    lastBackPressedTime = now;
    await AppUtils.showSnackBar(message: localeLang.doubleTabToExit, type: SnackBarType.info);
  }

  //* Methods
  Future<void> getInAppSystem() async {
    pageController = PageController(initialPage: currentTabIndex.value);
  }
}

class HomeTabInfo {
  final dynamic icon;
  final dynamic selectedIcon;
  final double? iconSize;
  final String title;
  final Widget widget;
  final bool hasBadge;

  HomeTabInfo({
    required this.icon,
    required this.selectedIcon,
    required this.title,
    required this.widget,
    this.iconSize,
    this.hasBadge = false,
  });
}
