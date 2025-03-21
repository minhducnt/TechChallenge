import 'dart:math';

import 'package:get/get.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/data/dummy/transaction.dummy.dart';
import 'package:sof_tracker/app/data/models/responses/transaction/my.transaction.model.dart';
import 'package:sof_tracker/app/global/extensions/num_extension.dart';
import 'package:sof_tracker/app/global/packages/graph_painter/chart.dart';
import 'package:sof_tracker/app/global/widgets/base/base_controller.dart';

class BarChartController extends BaseController with GetTickerProviderStateMixin {
  Map<int, List<ChartItem<void>>> barValues = <int, List<ChartItem<void>>>{}.obs;

  RxBool isChartLoading = false.obs;
  RxInt? selectedValue = DateTime.now().month.obs;
  RxInt selected = 0.obs;

  double targetMax = 0, targetMin = 0, maxiumValue = 0;
  int minItems = 7;

  final myTransaction = myTransactionDummy.map((item) => MyTransaction.fromJson(item)).toList();

  @override
  void onInit() {
    super.onInit();
    initValue();
  }

  @override
  void onClose() {
    barValues.clear();
    super.onClose();
  }

  //* Charts
  List<List<ChartItem<void>>> getMap() {
    return [
      barValues[0]!.toList(),
      barValues[1]!.toList(),
    ];
  }

  void initValue() {
    isChartLoading.value = true;

    try {
      final amounts = myTransaction.map((transaction) => transaction.amount?.roundToDouble() ?? 0.0).toList();

      targetMax = amounts.reduce(max);
      targetMin = amounts.reduce(min);
      maxiumValue = targetMax.formattedMaxValue.toDouble();

      final realValues = amounts.map((amount) => ChartItem<void>(amount)).toList();
      final fullValues = List.generate(minItems, (_) => ChartItem<void>(maxiumValue));

      barValues.addAll({0: fullValues, 1: realValues});
    } catch (e) {
      $log.e(e);
    } finally {
      isChartLoading.value = false;
    }
  }

  double calHorizontalAxisStep() {
    var res = .0;

    final maxValue = barValues[0]!.map((e) => e.max).reduce(
          (value, element) => value! > element! ? value : element,
        );

    final minValue = barValues[1]!.map((e) => e.max).reduce(
          (value, element) => value! < element! ? value : element,
        );

    res = (maxValue! - minValue!) / 3;

    return res;
  }

  void onRefresh() async {
    barValues.clear();
    initValue();
  }
}
