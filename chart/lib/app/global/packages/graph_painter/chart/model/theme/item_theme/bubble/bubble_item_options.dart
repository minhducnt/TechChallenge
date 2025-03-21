part of '../../../../../chart.dart';

/// Bubble painter
GeometryPainter<T> bubblePainter<T>(
  ChartItem<T> item,
  ChartData<T> data,
  ItemOptions itemOptions,
  DrawDataItem drawDataItem,
) =>
    BubbleGeometryPainter<T>(item, data, itemOptions, drawDataItem as BubbleItem);

typedef BubbleItemBuilder<T> = BubbleItem Function(ItemBuilderData<T>);

/// Extension options for bar items
/// [geometryPainter] is set to [BubbleGeometryPainter]
///
/// Extra options included in [BubbleGeometryPainter] are:
/// [border] Define border width and color
/// [gradient] Item can have gradient color
class BubbleItemOptions extends ItemOptions {
  /// Constructor for bubble item options, has some options just for [BubbleGeometryPainter]
  BubbleItemOptions({
    super.padding,
    super.multiValuePadding,
    super.maxBarWidth,
    super.minBarWidth,
    this.bubbleItemBuilder = _defaultBubbleItem,
  }) : super(geometryPainter: bubblePainter, itemBuilder: bubbleItemBuilder);

  BubbleItemOptions._lerp({
    super.padding,
    super.multiValuePadding,
    super.maxBarWidth,
    super.minBarWidth,
    required this.bubbleItemBuilder,
  }) : super._lerp(geometryPainter: bubblePainter, itemBuilder: bubbleItemBuilder);

  final BubbleItemBuilder bubbleItemBuilder;

  @override
  ItemOptions animateTo(ItemOptions endValue, double t) {
    if (endValue is BubbleItemOptions) {
      return BubbleItemOptions._lerp(
        bubbleItemBuilder: BubbleItemBuilderLerp.lerp(this, endValue, t),
        padding: EdgeInsets.lerp(padding, endValue.padding, t) ?? EdgeInsets.zero,
        multiValuePadding: EdgeInsets.lerp(multiValuePadding, endValue.multiValuePadding, t) ?? EdgeInsets.zero,
        maxBarWidth: lerpDouble(maxBarWidth, endValue.maxBarWidth, t),
        minBarWidth: lerpDouble(minBarWidth, endValue.minBarWidth, t),
      );
    } else {
      return endValue;
    }
  }
}

BubbleItem _defaultBubbleItem(ItemBuilderData _) {
  return BubbleItem();
}
