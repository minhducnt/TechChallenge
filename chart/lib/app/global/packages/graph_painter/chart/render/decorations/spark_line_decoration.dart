part of '../../../chart.dart';

/// Sparkline (Line graph) is considered to be just a decoration.
/// You need to use [BarGeometryPainter] or [BubbleGeometryPainter] in combination.
/// They can be transparent or be used to show values of the graph
class SparkLineDecoration extends DecorationPainter {
  /// Constructor for sparkline decoration
  SparkLineDecoration({
    this.id,
    this.fill = false,
    bool smoothPoints = false,
    this.lineWidth = 1.0,
    this.lineColor = Colors.red,
    this.startPosition = 0.5,
    this.gradient,
    this.listIndex = 0,
    this.dashArray,
    bool stretchLine = false,
  }) : _smoothPoints = smoothPoints ? 1.0 : 0.0,
       _stretchLine = stretchLine ? 1.0 : 0.0;

  SparkLineDecoration._lerp({
    this.id,
    this.fill = false,
    double smoothPoints = 0.0,
    this.lineWidth = 1.0,
    this.lineColor = Colors.red,
    this.startPosition = 0.5,
    this.gradient,
    this.listIndex = 0,
    required this.dashArray,
    double stretchLine = 0.0,
  }) : _smoothPoints = smoothPoints,
       _stretchLine = stretchLine;

  /// Is line or fill, line will have [lineWidth], setting
  /// [fill] to true will ignore [lineWidth]
  final bool fill;

  /// Is sparkline curve smooth (bezier) or lines
  bool get smoothPoints => _smoothPoints > 0.5;

  /// If od sparkline, with different ID's you can have more [SparkLineDecoration]
  /// on same data with different settings. (ex. One to fill and another for just line)
  final String? id;
  final double _smoothPoints;

  /// Dashed array for showing lines, if this is not set the line is solid
  final List<double>? dashArray;

  /// Set sparkline width
  final double lineWidth;

  /// Set sparkline color
  final Color lineColor;

  final double _stretchLine;

  /// Set sparkline start position.
  /// This value ranges from 0.0 - 1.0.
  ///
  /// 0.0 means that start position is right most point of the item,
  /// 1.0 means left most point.
  ///
  /// By default this is set to 0.5, so points are located in center of each [ChartItem]
  final double startPosition;

  /// Gradient color to take.
  ///
  /// Gradient is added as shader, [lineColor] can be used to change how shader is shown
  final Gradient? gradient;

  /// Index of list in items, this is used if there are multiple lists in the chart
  ///
  /// By default this will show first list and value will be 0
  final int listIndex;

  @override
  Size layoutSize(BoxConstraints constraints, ChartState state) {
    final size = (state.defaultPadding + state.defaultMargin).deflateSize(constraints.biggest);
    return size;
  }

  @override
  Offset applyPaintTransform(ChartState state, Size size) {
    return Offset(
      state.defaultPadding.left + state.defaultMargin.left,
      state.defaultPadding.top + state.defaultMargin.top,
    );
  }

  @override
  void draw(Canvas canvas, Size size, ChartState state) {
    final paint =
        Paint()
          ..color = lineColor
          ..style = fill ? PaintingStyle.fill : PaintingStyle.stroke
          ..strokeWidth = lineWidth;

    final maxValue = state.data.maxValue - state.data.minValue;
    final scale = size.height / maxValue;

    final positions = <Offset>[];

    final listSize = state.data.listSize;

    final itemWidth = size.width / listSize;

    final maxValueForKey = state.data.items[listIndex].fold(0.0, (double previousValue, element) {
      if (previousValue < (element.max ?? element.min ?? 0)) {
        return (element.max ?? element.min ?? 0);
      }

      return previousValue;
    });

    if (gradient != null) {
      // Compiler complains that gradient could be null. But unless if fails us that will never be null.
      paint.shader = gradient!.createShader(
        Rect.fromLTWH(0.0, size.height - (maxValueForKey * scale), size.width, maxValueForKey * scale),
        textDirection: TextDirection.ltr,
      );
    }

    state.data.items[listIndex].asMap().forEach((key, value) {
      final stretchPosition = _stretchLine * (key / (listSize - 1));
      final fixedPosition = (1 - _stretchLine) * startPosition;

      final position = itemWidth * (stretchPosition + fixedPosition);

      if (fill && key == 0) {
        positions.add(Offset(itemWidth * key + position, 0.0));
      }

      positions.add(
        Offset(itemWidth * key + position, size.height - ((value.max ?? 0.0) - state.data.minValue) * scale),
      );

      if (fill && state.data.items[listIndex].length - 1 == key) {
        positions.add(Offset(itemWidth * key + position, 0.0));
      }
    });

    final path = _getPoints(positions, fill, size);

    if (dashArray != null) {
      canvas.drawPath(dashPath(path, dashArray: dashArray!), paint);
    } else {
      canvas.drawPath(path, paint);
    }
  }

  /// Smooth out points and return path in turn
  /// Smoothing is done with quadratic bezier
  Path _getPoints(List<Offset> points, bool fill, Size size) {
    final points0 = fill ? points.getRange(1, points.length - 1).toList() : points;

    final path = Path();
    if (fill) {
      path.moveTo(points0[0].dx, size.height);
      path.lineTo(points0[0].dx, points0[0].dy);
      path.lineTo(points0.first.dx, points0.first.dy);
    } else {
      path.moveTo(points0[0].dx, points0[0].dy);
      path.lineTo(points0.first.dx, points0.first.dy);
    }

    for (var i = 0; i < points0.length - 1; i++) {
      final p1 = points0[i % points0.length];
      final p2 = points0[(i + 1) % points0.length];
      final controlPointX = p1.dx + ((p2.dx - p1.dx) / 2) * _smoothPoints;
      final mid = (p1 + p2) / 2;
      final firstLerpValue = lerpDouble(mid.dx, controlPointX, _smoothPoints) ?? size.height;
      final secondLerpValue = lerpDouble(mid.dy, p2.dy, _smoothPoints) ?? size.height;

      path.cubicTo(controlPointX, p1.dy, firstLerpValue, secondLerpValue, p2.dx, p2.dy);

      if (i == points0.length - 2) {
        path.lineTo(p2.dx, p2.dy);
        if (fill) {
          path.lineTo(p2.dx, size.height);
        }
      }
    }

    return path;
  }

  @override
  DecorationPainter animateTo(DecorationPainter endValue, double t) {
    if (endValue is SparkLineDecoration) {
      final smoothPointsLerp = lerpDouble(_smoothPoints, endValue._smoothPoints, t) ?? 0.0;
      final lineWidthLerp = lerpDouble(lineWidth, endValue.lineWidth, t) ?? 0.0;

      return SparkLineDecoration._lerp(
        fill: t > 0.5 ? endValue.fill : fill,
        id: endValue.id,
        smoothPoints: smoothPointsLerp,
        lineWidth: lineWidthLerp,
        startPosition: lerpDouble(startPosition, endValue.startPosition, t)!,
        lineColor: Color.lerp(lineColor, endValue.lineColor, t)!,
        gradient: Gradient.lerp(gradient, endValue.gradient, t),
        listIndex: endValue.listIndex,
        dashArray: endValue.dashArray,
        stretchLine: lerpDouble(_stretchLine, endValue._stretchLine, t)!,
      );
    }

    return this;
  }

  @override
  bool isSameType(DecorationPainter other) {
    if (other is SparkLineDecoration) {
      if (id != null && other.id != null) {
        return id == other.id && listIndex == other.listIndex;
      }

      return listIndex == other.listIndex;
    }

    return false;
  }
}
