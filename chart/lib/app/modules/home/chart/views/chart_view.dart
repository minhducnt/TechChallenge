import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/packages/graph_painter/chart.dart';
import 'package:sof_tracker/app/global/packages/graph_painter/widgets/line_chart.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_silver_view.dart';

import '../controllers/chart_controller.dart';

class ChartView extends BaseSilverView<ChartController> {
  const ChartView({super.key});

  @override
  Widget body(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                    LineChart.multiple(
                      controller.getMap(),
                      height: height * 0.4,
                      stack: false,
                      smoothCurves: controller.smoothPoints,
                      itemColor: theme.colorScheme.secondary.withValues(alpha: 0.0),
                      chartItemOptions: BubbleItemOptions(
                        maxBarWidth: 10,
                        bubbleItemBuilder: (data) {
                          return BubbleItem(color: [$r.theme.black, $r.theme.red, $r.theme.blue][data.listIndex]);
                        },
                      ),
                      backgroundDecorations: [
                        GridDecoration(
                          showVerticalGrid: false,
                          showHorizontalGrid: true,
                          showVerticalValues: true,
                          textStyle: theme.textTheme.bodySmall,
                          gridColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.2),
                        ),
                        SparkLineDecoration(
                          smoothPoints: true,
                          fill: true,
                          lineColor: $r.theme.blue.withValues(alpha: 0.2),
                          listIndex: 0,
                        ),

                        // WidgetDecoration(
                        //   widgetDecorationBuilder: (context, chartState, itemWidth, verticalMultiplier) {
                        //     return Positioned(
                        //       top: 0,
                        //       right: 0,
                        //       child: Container(
                        //         width: 4.w,
                        //         height: 4.w,
                        //         decoration: BoxDecoration(
                        //           color: $r.theme.blue.withValues(alpha: 0.8),
                        //           shape: BoxShape.circle,
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ],
                      foregroundDecorations: [
                        SparkLineDecoration(lineWidth: 2.0, smoothPoints: true, lineColor: $r.theme.blue),
                        SparkLineDecoration(
                          lineWidth: 1.5,
                          lineColor: Colors.grey,
                          smoothPoints: true,
                          dashArray: [5, 5], // Dotted line for 3-month average
                        ),
                      ],
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
