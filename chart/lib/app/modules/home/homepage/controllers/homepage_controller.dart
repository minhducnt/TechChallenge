import 'package:flutter/foundation.dart';
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
import 'package:sof_tracker/app/modules/home/bookmark/controllers/bookmark_controller.dart';
import 'package:sof_tracker/app/modules/home/bookmark/views/bookmark_view.dart';
import 'package:sof_tracker/app/modules/home/chart/views/chart_view.dart';
import 'package:sof_tracker/app/modules/home/dashboard/controllers/dashboard_controller.dart';
import 'package:sof_tracker/app/modules/home/dashboard/views/dashboard_view.dart';

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
  final tabs =
      [
        HomeTabInfo(
          title: localeLang.chart,
          icon: FluentIcons.arrow_trending_20_regular,
          selectedIcon: FluentIcons.arrow_trending_20_filled,
          iconSize: kIsWeb ? 24 : 20.sp,
          widget: const ChartView(),
        ),
        HomeTabInfo(
          title: localeLang.home,
          icon: FluentIcons.home_20_regular,
          selectedIcon: FluentIcons.home_20_filled,
          iconSize: kIsWeb ? 24 : 20.sp,
          widget: const DashboardView(),
        ),
        HomeTabInfo(
          title: localeLang.favorite,
          icon: FluentIcons.heart_20_regular,
          selectedIcon: FluentIcons.heart_20_filled,
          iconSize: kIsWeb ? 24 : 20.sp,
          widget: const BookmarkView(),
        ),
      ].obs;

  Future<void> onItemTapped(int index) async {
    currentTabIndex.value = index;
    pageController.jumpToPage(index);
    index == 0
        ? Get.find<DashboardController>().pagingController.refresh()
        : Get.find<BookmarkController>().pagingController.refresh();

    update();
  }

  Future<void> onItemSwipe(int index) async {
    currentTabIndex.value = index;
    await pageController.animateToPage(index, duration: $r.times.pageTransition, curve: Curves.easeInOut);
    index == 0
        ? Get.find<DashboardController>().pagingController.refresh()
        : Get.find<BookmarkController>().pagingController.refresh();
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
