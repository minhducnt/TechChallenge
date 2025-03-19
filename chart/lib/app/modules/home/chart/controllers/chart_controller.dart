import 'dart:math';

import 'package:get/get.dart';

import 'package:sof_tracker/app/global/packages/graph_painter/chart.dart';
import 'package:sof_tracker/app/global/widgets/base/base_controller.dart';

class ChartController extends BaseController {
  Map<int, List<ChartItem>> lineValues = <int, List<ChartItem>>{}.obs;

  var showValues = false;
  var smoothPoints = false;
  var fillLine = true;
  var showLine = true;
  var stack = true;

  double targetMax = 0;
  int minItems = 31;

  @override
  void onInit() {
    updateValues();
    super.onInit();
  }

  @override
  void onClose() {
    lineValues.clear();
    super.onClose();
  }

  void updateValues() {
    final Random rand = Random();
    final double difference = 2 + (rand.nextDouble() * 15);

    // Ensure targetMax always increases
    targetMax += difference * 0.5;

    double previousMax = 0;
    if (lineValues.isNotEmpty) {
      previousMax = lineValues.values
          .expand((items) => items)
          .map((item) => item.value)
          .reduce((a, b) => a > b ? a : b);
    }

    lineValues.addAll(
      List.generate(3, (index) {
        List<ChartItem<void>> items = [];
        for (int i = 0; i < minItems; i++) {
          // Ensure values always increase
          double newValue = previousMax + (rand.nextDouble() * difference);
          items.add(ChartItem<void>(newValue));
        }
        return items;
      }).asMap(),
    );
  }

  List<List<ChartItem<void>>> getMap() {
    return [
      lineValues[0]!.toList(),
      lineValues[1]!.asMap().map<int, ChartItem<void>>((index, e) => MapEntry(index, e)).values.toList(),
      lineValues[2]!.asMap().map<int, ChartItem<void>>((index, e) => MapEntry(index, e)).values.toList(),
    ];
  }
}
