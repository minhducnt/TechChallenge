import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/packages/chart/chart.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_silver_view.dart';
import 'package:sof_tracker/app/global/widgets/charts/line_chart.dart';

import '../controllers/chart_controller.dart';

class ChartView extends BaseSilverView<ChartController> {
  const ChartView({super.key});

  @override
  Widget body(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              //* Body
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //* Chart
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Stack(
                        children: [
                          LineChart<void>.multiple(
                            controller.getMap(),
                            height: height * 0.4,
                            stack: false,
                            smoothCurves: controller.smoothPoints.value,
                            itemColor: theme.colorScheme.secondary.withValues(alpha: 0.0),
                            chartItemOptions: BubbleItemOptions(
                              maxBarWidth: 0.0,
                              bubbleItemBuilder: (data) {
                                return BubbleItem(color: [$r.theme.black, $r.theme.red, $r.theme.blue][data.listIndex]);
                              },
                            ),
                            backgroundDecorations: [
                              GridDecoration(
                                showVerticalGrid: false,
                                showHorizontalGrid: false,
                                textStyle: theme.textTheme.bodySmall,
                                gridColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.2),
                              ),
                              SparkLineDecoration(
                                id: 'first_line_fill',
                                smoothPoints: true,
                                fill: true,
                                lineColor: $r.theme.blue.withValues(alpha: 0.2),
                                listIndex: 0,
                              ),
                            ],
                            foregroundDecorations: [
                              SparkLineDecoration(
                                id: 'first_line',
                                smoothPoints: true,
                                lineColor: $r.theme.blue,
                                listIndex: 0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
