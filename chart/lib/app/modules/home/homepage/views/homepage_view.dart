import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_silver_view.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends BaseSilverView<HomepageController> {
  const HomepageView({super.key});

  @override
  Widget body(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: $r.theme.transparent,
        systemNavigationBarColor: theme.colorScheme.onInverseSurface,
      ),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          controller.onBackCalled(context);
        },
        child: Obx(
          () => Scaffold(
            extendBody: true,
            backgroundColor: $r.theme.black,
            body: SafeArea(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  //* Page View
                  PageView(
                    controller: controller.pageController,
                    onPageChanged: (value) => controller.onItemSwipe(value),
                    children: controller.tabs.map((e) => e.widget).toList(),
                  ),
                  //* Bottom Navigation Bar
                  AnimatedBottomNavigationBar.builder(
                    itemCount: controller.tabs.length,
                    activeIndex: controller.currentTabIndex.value,
                    gapLocation: GapLocation.none,
                    notchSmoothness: NotchSmoothness.sharpEdge,
                    onTap: (index) => controller.onItemTapped(index),
                    splashColor: theme.colorScheme.primary,
                    splashRadius: 0,
                    scaleFactor: 0,
                    elevation: 0,
                    height: 60.h,
                    rightCornerRadius: 32.r,
                    leftCornerRadius: 32.r,
                    borderColor: $r.theme.transparent,
                    backgroundColor: theme.colorScheme.onInverseSurface,
                    tabBuilder: (index, isActive) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => Expanded(
                              child: Icon(
                                isActive ? controller.tabs[index].selectedIcon : controller.tabs[index].icon,
                                size: controller.tabs[index].iconSize,
                                color: isActive ? theme.colorScheme.primary : $r.theme.neutral2,
                              ),
                            ),
                          ),
                          Gap(4.h),
                          AnimatedDefaultTextStyle(
                            curve: Curves.easeOut,
                            duration: $r.times.oneSeconds,
                            style: text10.copyWith(
                              color: isActive ? theme.colorScheme.primary : $r.theme.neutral2,
                              fontSize: kIsWeb ? 9.sp : 10.sp,
                            ),
                            child: Text(controller.tabs[index].title),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
