part of '../../../../chart.dart';

/// Paint bar value item.
///
/// Bar value:
///    ┌───────────┐ --> Max value in set or from [ChartData.maxValue]
///    │           │
///    │   ┌───┐   │ --> ChartItem value
///    │   │   │   │
///    │   │   │   │
///    │   │   │   │
///    │   │   │   │
///    └───┴───┴───┘ --> 0 or [ChartData.minValue]
///
/// Candle value:
///    ┌───────────┐ --> Max value in set or [ChartData.maxValue]
///    │           │
///    │   ┌───┐   │ --> ChartItem max value
///    │   │   │   │
///    │   │   │   │
///    │   └───┘   │ --> ChartItem min value
///    │           │
///    └───────────┘ --> 0 or [ChartData.minValue]
///
class BarGeometryPainter<T> extends GeometryPainter<T> {
  /// Constructor for Bar painter
  BarGeometryPainter(ChartItem<T> super.item, super.data, super.itemOptions, this.drawDataItem);

  final BarItem drawDataItem;

  @override
  void draw(Canvas canvas, Size size, Paint paint) {
    final maxValue = data.maxValue - data.minValue;
    final verticalMultiplier = size.height / max(1, maxValue);
    final minValue = (data.minValue * verticalMultiplier);

    final radius = drawDataItem.radius ?? BorderRadius.zero;

    final itemMaxValue = item.max ?? 0.0;

    // If item is empty, or it's max value is below chart's minValue then don't draw it.
    // minValue can be below 0, this will just ensure that animation is drawn correctly.
    if (item.isEmpty || itemMaxValue < data.minValue) {
      return;
    }

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromPoints(
          Offset(
            0.0,
            maxValue * verticalMultiplier - max(data.minValue, item.min ?? 0.0) * verticalMultiplier + minValue,
          ),
          Offset(size.width, maxValue * verticalMultiplier - itemMaxValue * verticalMultiplier + minValue),
        ),
        bottomLeft: itemMaxValue.isNegative ? radius.topLeft : radius.bottomLeft,
        bottomRight: itemMaxValue.isNegative ? radius.topRight : radius.bottomRight,
        topLeft: itemMaxValue.isNegative ? radius.bottomLeft : radius.topLeft,
        topRight: itemMaxValue.isNegative ? radius.bottomRight : radius.topRight,
      ),
      paint,
    );

    final border = drawDataItem.border;

    if (border.style == BorderStyle.solid) {
      final borderPaint = Paint();
      borderPaint.style = PaintingStyle.stroke;
      borderPaint.color = border.color;
      borderPaint.strokeWidth = border.width;

      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromPoints(
            Offset(
              0.0,
              maxValue * verticalMultiplier - max(data.minValue, item.min ?? 0.0) * verticalMultiplier + minValue,
            ),
            Offset(size.width, maxValue * verticalMultiplier - itemMaxValue * verticalMultiplier + minValue),
          ),
          bottomLeft: itemMaxValue.isNegative ? radius.topLeft : radius.bottomLeft,
          bottomRight: itemMaxValue.isNegative ? radius.topRight : radius.bottomRight,
          topLeft: itemMaxValue.isNegative ? radius.bottomLeft : radius.topLeft,
          topRight: itemMaxValue.isNegative ? radius.bottomRight : radius.topRight,
        ),
        borderPaint,
      );
    }
  }
}
