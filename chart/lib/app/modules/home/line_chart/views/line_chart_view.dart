import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/packages/graph_painter/chart.dart';
import 'package:sof_tracker/app/global/packages/graph_painter/widgets/line_chart.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';
import 'package:sof_tracker/app/global/widgets/base/base_silver_view.dart';
import 'package:sof_tracker/app/global/widgets/utils/loading_widget.dart';
import 'package:sof_tracker/app/modules/home/line_chart/components/tab_item.dart';

import '../controllers/line_chart_controller.dart';

class LineChartView extends BaseSilverView<LineChartController> {
  const LineChartView({super.key});

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
              Container(
                height: 226.h,
                width: 400.w,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                margin: EdgeInsets.symmetric(horizontal: 16),
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
                    DefaultTabController(
                      length: 2,
                      child: Container(
                        height: 48,
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: $r.theme.neutral4,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: TabBar(
                          controller: controller.tabController,
                          indicatorColor: $r.theme.transparent,
                          dividerColor: $r.theme.transparent,
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelColor: $r.theme.neutral2,
                          unselectedLabelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
                          labelColor: $r.theme.white,
                          labelPadding: EdgeInsets.zero,
                          labelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
                          onTap: (index) => controller.onTabChange(index),
                          tabs: [
                            TabItem(
                              itemName: "Dinero en",
                              isSelected: controller.currentTabIndex.value == 0,
                              value: "24,925.00",
                              unit: "\$",
                            ),
                            TabItem(
                              itemName: "Gastos",
                              isSelected: controller.currentTabIndex.value == 1,
                              value: "4,925.10",
                              unit: "-\$",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(24.h),

                    Expanded(
                      child: controller.isChartLoading.value
                          ? CustomLoading()
                          : LineChart(
                              data: controller.getMap(),
                              dataToValue: (item) => item.max ?? 0,
                              itemColor: controller.currentTabIndex.value == 0 ? $r.theme.blue : $r.theme.red,
                              lineWidth: 1.5,
                              chartItemOptions: BubbleItemOptions(
                                maxBarWidth: 8.r,
                                bubbleItemBuilder: (data) {
                                  final isLastDay = data.itemIndex == controller.lineValues.length - 1;
                                  final isCurrentTab = controller.currentTabIndex.value == 0;
                                  final color =
                                      isLastDay ? (isCurrentTab ? $r.theme.blue : $r.theme.red) : $r.theme.transparent;
                                  return BubbleItem(
                                    color: data.listIndex == 0 ? color : $r.theme.transparent,
                                  );
                                },
                              ),
                              chartBehaviour: ChartBehaviour(
                                onItemClicked: (value) {
                                  controller.onItemHoverEnter(value);
                                },
                                onItemHoverEnter: (value) {
                                  controller.onItemHoverEnter(value);
                                },
                              ),
                              backgroundDecorations: [
                                GridDecoration(
                                  showVerticalGrid: false,
                                  showHorizontalGrid: true,
                                  showVerticalValues: true,
                                  horizontalAxisStep: 10,
                                  textStyle: theme.textTheme.labelSmall!.copyWith(fontSize: 10),
                                  gridColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.1),
                                  verticalAxisValueFromIndex: (value) => controller.customAxisValueFromIndex(
                                    value,
                                    controller.selectedValue!.value.toDouble(),
                                  ),
                                  verticalValuesPadding: EdgeInsets.only(top: 8.h),
                                  verticalTextAlign: TextAlign.center,
                                ),
                                SparkLineDecoration(
                                  fill: true,
                                  smoothPoints: false,
                                  lineColor: controller.currentTabIndex.value == 0
                                      ? $r.theme.blue.withValues(alpha: 0.1)
                                      : $r.theme.red.withValues(alpha: 0.1),
                                  listIndex: 0,
                                ),
                              ],
                              foregroundDecorations: [
                                //* Tooltip
                                // SelectedItemDecoration(
                                //   controller.selected.value,
                                //   selectedColor: $r.theme.blue.withValues(alpha: 0.2),
                                //   backgroundColor: $r.theme.neutral3.withValues(alpha: .5),
                                // ),
                              ],
                            ),
                    ),

                    //* Legend
                    Gap(8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 2.h,
                              decoration: BoxDecoration(
                                color: $r.theme.blue,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            Gap(4.w),
                            Text(
                              localeLang.currentMonth,
                              style: text10.semiBold.copyWith(
                                color: $r.theme.blue,
                              ),
                            ),
                          ],
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
