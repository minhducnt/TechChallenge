part of '../../../chart.dart';

/// Paints border around the whole chart
class BorderDecoration extends DecorationPainter {
  /// Makes border decoration around the chart
  BorderDecoration({double? borderWidth, Border? sidesWidth, this.color = Colors.black, bool endWithChart = false})
    : assert(borderWidth == null || sidesWidth == null, 'Can\'t use `borderWidth` and `width`!'),
      _endWithChart = endWithChart ? 1.0 : 0.0,
      _borderWidth = sidesWidth ?? Border.all(width: borderWidth ?? 2.0, color: color);

  BorderDecoration._lerp({required Border borderWidth, this.color = Colors.black, required double endWithChart})
    : _endWithChart = endWithChart,
      _borderWidth = borderWidth;

  /// Color for border, individual side colors can be set with [_borderWidth] otherwise this color
  /// is used as fallback
  final Color color;

  final Border _borderWidth;
  final double _endWithChart;

  @override
  Offset applyPaintTransform(ChartState state, Size size) {
    return Offset(
      ((state.defaultMargin.left - marginNeeded().left) + state.defaultPadding.left) * _endWithChart,
      ((state.defaultMargin.top - marginNeeded().top) + state.defaultPadding.top) * _endWithChart,
    );
  }

  @override
  Size layoutSize(BoxConstraints constraints, ChartState state) {
    final size =
        constraints.deflate(((state.defaultMargin - marginNeeded()) + state.defaultPadding) * _endWithChart).biggest;
    return size;
  }

  @override
  void draw(Canvas canvas, Size size, ChartState state) {
    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..color = color;

    final height = size.height + _borderWidth.dimensions.vertical;
    final width = size.width - _borderWidth.dimensions.horizontal;

    paint.strokeWidth = _borderWidth.top.width;
    paint.color = _borderWidth.top.color;
    _drawLine(
      canvas,
      Offset(0.0, _borderWidth.top.width / 2),
      Offset(width + _borderWidth.dimensions.horizontal, _borderWidth.top.width / 2),
      paint,
    );

    paint.strokeWidth = _borderWidth.right.width;
    paint.color = _borderWidth.right.color;
    _drawLine(
      canvas,
      Offset(width + _borderWidth.left.width + _borderWidth.right.width / 2, _borderWidth.top.width),
      Offset(
        width + _borderWidth.left.width + _borderWidth.right.width / 2,
        height - _borderWidth.dimensions.vertical - _borderWidth.bottom.width,
      ),
      paint,
    );

    paint.strokeWidth = _borderWidth.bottom.width;
    paint.color = _borderWidth.bottom.color;
    _drawLine(
      canvas,
      Offset(
        width + _borderWidth.dimensions.horizontal,
        height - _borderWidth.dimensions.vertical - (_borderWidth.bottom.width / 2),
      ),
      Offset(0.0, height - _borderWidth.dimensions.vertical - (_borderWidth.bottom.width / 2)),
      paint,
    );

    paint.strokeWidth = _borderWidth.left.width;
    paint.color = _borderWidth.left.color;
    _drawLine(
      canvas,
      Offset(
        -_borderWidth.left.width + _borderWidth.dimensions.horizontal - (_borderWidth.left.width / 2),
        height - _borderWidth.dimensions.vertical - _borderWidth.bottom.width,
      ),
      Offset(
        -_borderWidth.left.width + _borderWidth.dimensions.horizontal - (_borderWidth.left.width / 2),
        _borderWidth.top.width,
      ),
      paint,
    );
  }

  void _drawLine(Canvas canvas, Offset p1, Offset p2, Paint p) {
    if (p.strokeWidth == 0.0) {
      return;
    }

    canvas.drawLine(p1, p2, p);
  }

  @override
  EdgeInsets marginNeeded() {
    return _borderWidth.dimensions.resolve(TextDirection.ltr);
  }

  @override
  DecorationPainter animateTo(DecorationPainter endValue, double t) {
    if (endValue is BorderDecoration) {
      return BorderDecoration._lerp(
        borderWidth: Border.lerp(_borderWidth, endValue._borderWidth, t) ?? endValue._borderWidth,
        color: Color.lerp(color, endValue.color, t) ?? endValue.color,
        endWithChart: lerpDouble(_endWithChart, endValue._endWithChart, t) ?? endValue._endWithChart,
      );
    }

    return this;
  }
}
