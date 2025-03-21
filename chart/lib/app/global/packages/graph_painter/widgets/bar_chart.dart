import 'package:flutter/material.dart';
import 'package:sof_tracker/app/global/packages/graph_painter/chart.dart';

typedef DataToValue<T> = double Function(T item);
typedef DataToAxis<T> = String Function(int item);

/// Short-hand to easier create several bar charts
class BarChart<T> extends StatelessWidget {
  BarChart({
    required List<T> data,
    required DataToValue<T> dataToValue,
    this.height = 240.0,
    this.backgroundDecorations = const [],
    this.foregroundDecorations = const [],
    this.chartBehaviour = const ChartBehaviour(),
    this.itemOptions = const BarItemOptions(),
    this.stack = false,
    super.key,
  }) : _mappedValues = [data.map((e) => ChartItem<T>(dataToValue(e))).toList()];

  const BarChart.map(
    this._mappedValues, {
    this.height = 240.0,
    this.backgroundDecorations = const [],
    this.foregroundDecorations = const [],
    this.chartBehaviour = const ChartBehaviour(),
    this.itemOptions = const BarItemOptions(),
    this.stack = false,
    super.key,
  });

  final List<List<ChartItem<T>>> _mappedValues;
  final double height;

  final bool stack;
  final ItemOptions itemOptions;
  final ChartBehaviour chartBehaviour;
  final List<DecorationPainter> backgroundDecorations;
  final List<DecorationPainter> foregroundDecorations;

  @override
  Widget build(BuildContext context) {
    final data = ChartData<T>(
      _mappedValues,
      valueAxisMaxOver: 1,
      dataStrategy: stack ? StackDataStrategy() : DefaultDataStrategy(stackMultipleValues: true),
    );

    return AnimatedChart<T>(
      height: height,
      width: MediaQuery.of(context).size.width - 24.0,
      duration: const Duration(milliseconds: 450),
      state: ChartState<T>(
        data: data,
        itemOptions: itemOptions,
        behaviour: chartBehaviour,
        foregroundDecorations: foregroundDecorations,
        backgroundDecorations: [
          ...backgroundDecorations,
        ],
      ),
    );
  }
}
