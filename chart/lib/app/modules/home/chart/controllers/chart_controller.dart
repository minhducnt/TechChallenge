import 'dart:math';

import 'package:get/get.dart';

import 'package:sof_tracker/app/global/packages/chart/chart.dart';
import 'package:sof_tracker/app/global/widgets/base/base_controller.dart';

class ChartController extends BaseController {
  Map<int, List<ChartItem>> lineValues = <int, List<ChartItem>>{}.obs;

  var showValues = false.obs;
  var smoothPoints = false.obs;
  var fillLine = true.obs;
  var showLine = true.obs;
  var stack = true.obs;

  double targetMax = 0;
  int minItems = 15;

  @override
  void onInit() {
    updateValues();
    super.onInit();
  }

  @override
  void onClose() {
    showValues.close();
    smoothPoints.close();
    fillLine.close();
    showLine.close();
    stack.close();

    super.onClose();
  }

  void updateValues() {
    final Random rand = Random();
    final double difference = 2 + (rand.nextDouble() * 15);

    targetMax = 3 + (rand.nextDouble() * difference * 0.75) - (difference * 0.25);

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
          items.add(ChartItem<void>(previousMax + rand.nextDouble() * difference));
        }
        return items;
      }).asMap(),
    );
  }

  void addValues() {
    lineValues.addAll(
      List.generate(3, (index) {
        List<ChartItem<void>> items = [];
        for (int i = 0; i < minItems; i++) {
          items.add(ChartItem<void>(2 + Random().nextDouble() * targetMax));
        }
        return items;
      }).asMap(),
    );
  }

  List<List<ChartItem<void>>> getMap() {
    return [
      lineValues[0]!.toList(),
      lineValues[1]!
          .asMap()
          .map<int, ChartItem<void>>((index, e) {
            return MapEntry(index, e);
          })
          .values
          .toList(),
      lineValues[2]!
          .asMap()
          .map<int, ChartItem<void>>((index, e) {
            return MapEntry(index, e);
          })
          .values
          .toList(),
    ];
  }
}
