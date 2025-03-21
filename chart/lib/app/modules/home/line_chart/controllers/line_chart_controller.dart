import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/data/dummy/money.deposit.dummy.dart';
import 'package:sof_tracker/app/data/models/responses/deposit/money.deposit.model.dart';
import 'package:sof_tracker/app/global/packages/graph_painter/chart.dart';
import 'package:sof_tracker/app/global/widgets/base/base_controller.dart';

class LineChartController extends BaseController with GetSingleTickerProviderStateMixin {
  //* Charts
  List<ChartItem> lineValues = <ChartItem>[].obs;
  RxBool isChartLoading = false.obs;
  RxInt? selectedValue = DateTime.now().month.obs;
  RxInt selected = 0.obs;

  //* Tabs
  RxInt currentTabIndex = 0.obs;
  late TabController tabController;

  //* Dummy data
  final deposit = MoneyDeposit(data: moneyDepositDummy2.map((item) => Data.fromJson(item)).toList());

  @override
  void onInit() {
    initValuesFromDummyData();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    lineValues.clear();
    super.onClose();
  }

  //* Chart
  List<ChartItem> getMap() => lineValues;

  String customAxisValueFromIndex(int index, double selectedValue) {
    DateTime now = DateTime.now();
    int lastDay = DateTime(now.year, selectedValue.toInt() + 1, 0).day;

    List<int> labels = [0, 7, 15, 22, lastDay - 1];

    return labels.contains(index) ? "${index + 1}" : "";
  }

  //* Value
  void initValuesFromDummyData() {
    isChartLoading.value = true;

    try {
      final int daysInMonth = deposit.data!.length;
      List<ChartItem<void>> fullMonthData = deposit.data!.map((data) => ChartItem<void>(data.amount, min: 0)).toList();

      fullMonthData = fullMonthData.map((data) {
        return ChartItem<void>(data.max! / 1000000, min: 0);
      }).toList();

      if (fullMonthData.length > daysInMonth) {
        fullMonthData = fullMonthData.sublist(0, daysInMonth);
      }

      lineValues = fullMonthData;
    } catch (e) {
      $log.e(e.toString());
    }

    isChartLoading.value = false;
  }

  //* Tab
  void onTabChange(int index) {
    if (currentTabIndex.value == index) return;
    currentTabIndex.value = index;
    tabController.animateTo(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    initValuesFromDummyData();
  }

  void onItemHoverEnter(ItemBuilderData value) {
    selected.value = value.itemIndex;
  }
}
