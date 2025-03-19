part of '../../../chart.dart';

/// Used by default and it won't do anything to the data just pass it along
class DefaultDataStrategy extends DataStrategy {
  const DefaultDataStrategy({required super.stackMultipleValues});
  const DefaultDataStrategy._lerp(super.stackMultipleValuesProgress) : super._lerp();

  @override
  List<List<ChartItem<T?>>> formatDataStrategy<T>(List<List<ChartItem<T?>>> items) => items;

  @override
  DataStrategy animateTo(DataStrategy dataStrategy, double t) {
    if (dataStrategy is DefaultDataStrategy) {
      return DefaultDataStrategy._lerp(
        lerpDouble(_stackMultipleValuesProgress, dataStrategy._stackMultipleValuesProgress, t) ??
            dataStrategy._stackMultipleValuesProgress,
      );
    }

    return dataStrategy;
  }
}
