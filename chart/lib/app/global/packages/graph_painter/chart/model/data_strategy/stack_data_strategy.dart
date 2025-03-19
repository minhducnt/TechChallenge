part of '../../../chart.dart';

/// Stacks multiple lists one on top of another.
///
/// ex.
/// List with:
/// [
///   [1, 3, 2],
///   [3, 2, 1]
/// ]
///
/// will become:
/// [
///   [1, 3, 2],
///   [4, 5, 3]
/// ]
class StackDataStrategy extends DataStrategy {
  const StackDataStrategy() : super(stackMultipleValues: true);

  @override
  List<List<ChartItem<T?>>> formatDataStrategy<T>(List<List<ChartItem<T?>>> items) {
    final incrementList = <ChartItem<T?>>[];
    return items.reversed
        .map((entry) {
          return entry.asMap().entries.map((e) {
            if (incrementList.length > e.key) {
              final newValue = e.value + incrementList[e.key];
              incrementList[e.key] = (incrementList[e.key] + e.value);
              return newValue;
            } else {
              incrementList.add(e.value);
            }

            return e.value;
          }).toList();
        })
        .toList()
        .reversed
        .toList();
  }

  @override
  DataStrategy animateTo(DataStrategy dataStrategy, double t) {
    return dataStrategy;
  }
}
