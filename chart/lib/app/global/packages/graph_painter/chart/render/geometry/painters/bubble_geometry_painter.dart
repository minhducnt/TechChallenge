part of '../../../../chart.dart';

/// Paint bubble value item.
///
///    ┌───────────┐ --> Max value in set or [ChartData.axisMax]
///    │           │
///    │           │
///    │    /⎺⎺\   │ --> ChartItem max value
///    │    \__/   │
///    │           │
///    │           │
///    └───────────┘ --> 0 or [ChartData.axisMin]
///
class BubbleGeometryPainter<T> extends GeometryPainter<T> {
  /// Constructor for bubble painter
  BubbleGeometryPainter(ChartItem<T> super.item, super.data, super.itemOptions, this.drawDataItem);

  final BubbleItem drawDataItem;

  @override
  void draw(Canvas canvas, Size size, Paint paint) {
    final maxValue = data.maxValue - data.minValue;
    final verticalMultiplier = size.height / max(1, maxValue);
    final minValue = data.minValue * verticalMultiplier;

    final itemWidth = max(
      itemOptions.minBarWidth ?? 0.0,
      min(
        itemOptions.maxBarWidth ?? double.infinity,
        size.width - (itemOptions.padding.horizontal.isNegative ? 0.0 : itemOptions.padding.horizontal),
      ),
    );

    final itemMaxValue = item.max ?? 0.0;
    // If item is empty, or it's max value is below chart's minValue then don't draw it.
    // minValue can be below 0, this will just ensure that animation is drawn correctly.
    if (item.isEmpty || itemMaxValue < data.minValue) {
      return;
    }

    /// Bubble value, we need to draw a circle for this one
    final circleSize = itemWidth / 2;

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height - itemMaxValue * verticalMultiplier - minValue),
      circleSize,
      paint,
    );

    if (itemOptions is BubbleItemOptions) {
      final border = drawDataItem.border;

      if (border.style == BorderStyle.solid) {
        final borderPaint = Paint();
        borderPaint.style = PaintingStyle.stroke;

        borderPaint.color = border.color;
        borderPaint.strokeWidth = border.width;

        canvas.drawCircle(
          Offset(size.width * 0.5, size.height - itemMaxValue * verticalMultiplier - minValue),
          circleSize,
          borderPaint,
        );
      }
    }
  }
}
