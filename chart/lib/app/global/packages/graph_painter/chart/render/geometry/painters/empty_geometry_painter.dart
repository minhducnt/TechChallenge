part of '../../../../chart.dart';

/// Empty geometry painter. Used if you don't want to use [DecorationPainter] to paint the items.
class _EmptyGeometryPainter<T> extends GeometryPainter<T> {
  _EmptyGeometryPainter(ChartItem<T> super.item, super.data, super.itemOptions);

  @override
  void draw(Canvas canvas, Size size, Paint paint) {
    // NOOP
  }
}
