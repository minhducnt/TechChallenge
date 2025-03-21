import 'package:flutter/material.dart';

import '../chart.dart';

typedef DataToValue<T> = double Function(T item);
typedef DataToAxis<T> = String Function(int item);

class LineChart<T> extends StatelessWidget {
  LineChart({
    required List<T> data,
    required DataToValue<T> dataToValue,
    this.height = 240.0,
    this.lineWidth = 2.0,
    this.itemColor = Colors.red,
    this.backgroundDecorations = const [],
    this.foregroundDecorations = const [],
    this.chartItemOptions,
    this.chartBehaviour = const ChartBehaviour(),
    this.smoothCurves = false,
    this.gradient,
    this.stack = false,
    super.key,
  }) : _mappedValues = [data.map((e) => ChartItem<T>(dataToValue(e))).toList()];

  const LineChart.multiple(
    this._mappedValues, {
    this.height = 240.0,
    this.lineWidth = 2.0,
    this.itemColor = Colors.red,
    this.backgroundDecorations = const [],
    this.foregroundDecorations = const [],
    this.chartItemOptions,
    this.chartBehaviour = const ChartBehaviour(),
    this.smoothCurves = false,
    this.gradient,
    this.stack = false,
    super.key,
  });

  final double height;

  final bool smoothCurves;
  final Color itemColor;
  final Gradient? gradient;
  final double lineWidth;
  final bool stack;

  final List<DecorationPainter> backgroundDecorations;
  final List<DecorationPainter> foregroundDecorations;
  final ChartBehaviour chartBehaviour;
  final ItemOptions? chartItemOptions;

  final List<List<ChartItem<T>>> _mappedValues;

  @override
  Widget build(BuildContext context) {
    return AnimatedChart<T>(
      height: height,
      duration: const Duration(milliseconds: 450),
      state: ChartState<T>(
        data: ChartData(
          _mappedValues,
          dataStrategy: stack ? StackDataStrategy() : DefaultDataStrategy(stackMultipleValues: true),
        ),
        itemOptions: chartItemOptions ?? BarItemOptions(barItemBuilder: (_) => BarItem()),
        behaviour: chartBehaviour,
        foregroundDecorations: [
          SparkLineDecoration(
            id: 'chart_decoration',
            lineWidth: lineWidth,
            lineColor: itemColor,
            gradient: gradient,
            smoothPoints: smoothCurves,
          ),
          ...foregroundDecorations,
        ],
        backgroundDecorations: [...backgroundDecorations],
      ),
    );
  }
}
