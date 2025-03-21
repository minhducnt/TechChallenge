import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/constants/resources/assets.gen.dart';
import 'package:sof_tracker/app/global/extensions/date_time_extension.dart';
import 'package:sof_tracker/app/global/extensions/num_extension.dart';
import 'package:sof_tracker/app/global/packages/graph_painter/chart.dart';
import 'package:sof_tracker/app/global/packages/graph_painter/widgets/bar_chart.dart';
import 'package:sof_tracker/app/global/widgets/base/base_silver_view.dart';

import '../controllers/bar_chart_controller.dart';

class BarChartView extends BaseSilverView<BarChartController> {
  const BarChartView({super.key});

  @override
  Widget body(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: $r.theme.black,
      body: SafeArea(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 226.h,
                    width: 400.w,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: $r.theme.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primaryContainer.withValues(alpha: 0.2),
                          blurRadius: 8.r,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Tus transacciones',
                                      style: TextStyle(
                                        color: $r.theme.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Gap(4.w),
                                    Assets.icons.infoCircleRegular.svg(
                                      width: 16.w,
                                      height: 16.h,
                                      colorFilter: ColorFilter.mode($r.theme.blue, BlendMode.srcIn),
                                    ),
                                  ],
                                ),
                              ),
                              CupertinoButton(
                                onPressed: () => controller.onRefresh(),
                                padding: EdgeInsets.zero,
                                child: Assets.icons.reloadCircleRegular.svg(
                                  width: 32.w,
                                  height: 32.h,
                                  colorFilter: ColorFilter.mode($r.theme.black, BlendMode.srcIn),
                                ),
                              )
                            ],
                          ),
                        ),
                        Gap(24),
                        SizedBox(
                          height: 150.h,
                          child: BarChart.map(
                            controller.getMap(),
                            itemOptions: WidgetItemOptions(widgetItemBuilder: (data) {
                              var borderRadius = BorderRadius.vertical(
                                top: Radius.circular(60.r),
                                bottom: Radius.circular(60.r),
                              );
                              if (data.listIndex == 1) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius,
                                    border: Border.all(
                                      color: $r.theme.neutral3,
                                      width: 0.4,
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        $r.theme.chart1,
                                        $r.theme.chart2,
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius,
                                    color: $r.theme.black.withValues(alpha: 0.8),
                                    border: Border.all(
                                      color: $r.theme.black.withValues(alpha: 0.5),
                                      width: 1,
                                    ),
                                  ),
                                );
                              }
                            }),
                            backgroundDecorations: [
                              GridDecoration(
                                showHorizontalGrid: false,
                                showVerticalGrid: false,
                                showHorizontalValues: true,
                                showVerticalValues: true,
                                endWithChartHorizontal: false,
                                showTopHorizontalValue: true,
                                horizontalLegendPosition: HorizontalLegendPosition.start,
                                horizontalAxisStep: controller.calHorizontalAxisStep(),
                                verticalValuesPadding: EdgeInsets.only(top: 16.h),
                                textStyle: theme.textTheme.labelSmall!.copyWith(fontSize: 10),
                                horizontalAxisValueFromValue: (value) {
                                  return value == 0 ? 1000.formattedCompact : value.formattedCompact;
                                },
                                verticalAxisValueFromIndex: (value) {
                                  return value.toString().dayOfWeek;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 2,
                    child: CupertinoButton(
                      onPressed: () => {},
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: $r.theme.neutral3,
                          borderRadius: BorderRadius.circular(60.r),
                        ),
                        child: Assets.icons.circleArrowLeft01Regular.svg(
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode($r.theme.white, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 2,
                    child: CupertinoButton(
                      onPressed: () => {},
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: $r.theme.neutral3,
                          borderRadius: BorderRadius.circular(60.r),
                        ),
                        child: Assets.icons.circleArrowRight01Regular.svg(
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode($r.theme.white, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
