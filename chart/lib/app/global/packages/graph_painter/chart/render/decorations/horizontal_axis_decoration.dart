part of '../../../chart.dart';

/// Position of legend in [HorizontalAxisDecoration]
enum HorizontalLegendPosition {
  /// Show axis legend at the start of the chart
  start,

  /// Show legend at the end of the decoration
  end,
}

typedef AxisValueFromValue = String Function(int value);

/// Default axis generator, it will just take current index, convert it to string and return it.
String defaultAxisValue(int index) => '$index';

typedef ShowLineForValue = bool Function(int value);

/// Decoration for drawing horizontal lines on the chart, decoration can add horizontal axis legend
///
/// This can be used if you don't need anything from [VerticalAxisDecoration], otherwise you might
/// consider using [GridDecoration]
class HorizontalAxisDecoration extends DecorationPainter {
  /// Constructor for horizontal axis decoration
  HorizontalAxisDecoration({
    this.showValues = false,
    bool endWithChart = false,
    this.showTopValue = false,
    this.showLines = true,
    this.valuesAlign = TextAlign.end,
    this.valuesPadding = EdgeInsets.zero,
    this.lineColor = Colors.grey,
    this.lineWidth = 1.0,
    this.horizontalAxisUnit,
    this.dashArray,
    this.axisValue = defaultAxisValue,
    this.axisStep = 1.0,
    this.textScale = 1.0,
    this.legendPosition = HorizontalLegendPosition.end,
    this.legendFontStyle = const TextStyle(fontSize: 12.0),
    this.showLineForValue,
    this.asFixedDecoration = false,
  })  : assert(axisStep > 0, 'axisStep must be greater than zero!'),
        _endWithChart = endWithChart ? 1.0 : 0.0;

  HorizontalAxisDecoration._lerp({
    this.showValues = false,
    double endWithChart = 0.0,
    this.showTopValue = false,
    this.showLines = true,
    this.valuesAlign = TextAlign.end,
    this.valuesPadding = EdgeInsets.zero,
    this.lineColor = Colors.grey,
    this.lineWidth = 1.0,
    this.horizontalAxisUnit,
    this.axisStep = 1.0,
    this.dashArray,
    this.textScale = 1.0,
    this.axisValue = defaultAxisValue,
    this.legendPosition = HorizontalLegendPosition.end,
    this.legendFontStyle = const TextStyle(fontSize: 12.0),
    required this.showLineForValue,
    this.asFixedDecoration = false,
  }) : _endWithChart = endWithChart;

  final bool asFixedDecoration;

  /// This decoration can continue beyond padding set by [ChartState]
  /// setting this to true will stop drawing on padding, and will end
  /// at same place where the chart will end
  ///
  /// This does not apply to axis legend text, text can still be shown on the padding part
  bool get endWithChart => _endWithChart > 0.5;
  final double _endWithChart;

  /// Dashed array for showing lines, if this is not set the line is solid
  final List<double>? dashArray;

  /// Show axis legend values
  final bool showValues;

  /// Align text on the axis legend
  final TextAlign valuesAlign;

  /// Padding for the values in the axis legend
  final EdgeInsets? valuesPadding;

  /// Should top horizontal value be shown? This will increase padding such that
  /// text fits above the chart and adds top most value on horizontal scale.
  final bool showTopValue;

  /// Horizontal legend position
  /// Default: [HorizontalLegendPosition.end]
  /// Can be [HorizontalLegendPosition.start] or [HorizontalLegendPosition.end]
  final HorizontalLegendPosition legendPosition;

  /// Generate horizontal axis legend from value steps
  final AxisValueFromValue axisValue;

  /// Label that is shown at the end of the chart on horizontal axis.
  /// This is usually to show measure unit used for axis
  final String? horizontalAxisUnit;

  /// Show horizontal lines
  final bool showLines;

  /// Function to have more fine grain control over when to show horizontal lines
  /// If this is not null [showLines] will be ignored
  final ShowLineForValue? showLineForValue;

  /// Set color to paint horizontal lines with
  final Color lineColor;

  /// Set line width
  final double lineWidth;

  /// Step for lines
  final double axisStep;

  /// Text style for axis legend
  final TextStyle? legendFontStyle;

  final double textScale;

  String? _longestText;

  @override
  Size layoutSize(BoxConstraints constraints, ChartState state) {
    return constraints
        .deflate(
          state.defaultMargin +
              state.defaultPadding.copyWith(
                left: _endWithChart * state.defaultPadding.left,
                right: _endWithChart * state.defaultPadding.right,
              ),
        )
        .biggest;
  }

  @override
  Offset applyPaintTransform(ChartState state, Size size) {
    return Offset(
      state.defaultMargin.left + (_endWithChart * state.defaultPadding.left),
      state.defaultMargin.top + state.defaultPadding.top,
    );
  }

  @override
  void initDecoration(ChartState state) {
    final maxValue = state.data.maxValue - state.data.minValue;

    for (var i = 0; i * axisStep <= maxValue; i++) {
      final defaultValue = (axisStep * i + state.data.minValue).toInt();
      final value = axisValue.call(defaultValue);
      if ((_longestText?.length ?? 0) < value.length) {
        _longestText = value;
      }
    }
  }

  @override
  void draw(Canvas canvas, Size size, ChartState state) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    canvas.save();
    final maxValue = state.data.maxValue - state.data.minValue;
    final height = ((size.height) - lineWidth);
    final scale = height / maxValue;
    final gridPath = Path();

    for (var i = 0; i * scale * axisStep <= scale * maxValue; i++) {
      final defaultValue = (axisStep * i + state.data.minValue).toInt();

      final isPositionStart = legendPosition == HorizontalLegendPosition.start;
      final startLine = isPositionStart ? -((state.defaultMargin.left) * (1 - _endWithChart)) : 0.0;
      final endLine = isPositionStart ? 0.0 : ((state.defaultMargin.right) * (1 - _endWithChart));

      if (showLineForValue?.call(defaultValue) ?? showLines) {
        gridPath.moveTo(startLine, size.height - (lineWidth / 2 + axisStep * i * scale));
        gridPath.lineTo((size.width + endLine), size.height - (lineWidth / 2 + axisStep * i * scale));
      }

      if (!showValues) {
        continue;
      }

      String? text;

      if (!showTopValue && i == maxValue / axisStep) {
        text = null;
      } else {
        final value = axisValue.call(defaultValue);
        text = value.toString();
      }

      if (text == null) {
        continue;
      }

      final textPainter = _getTextPainter(text, size: asFixedDecoration ? size : null);

      final positionEnd = size.width + (valuesPadding?.left ?? 0);
      final positionStart = -((valuesPadding?.right ?? 0.0) + _getTextPainter(_longestText).width);
      final isEnd = maxValue == defaultValue + 1;

      double adjustedYOffset = 0.0;
      if (i == 0) {
        adjustedYOffset = textPainter.height;
      } else if (isEnd) {
        adjustedYOffset = textPainter.height / 2 - 3;
      } else {
        adjustedYOffset += 7;
      }

      textPainter.paint(
        canvas,
        Offset(
          legendPosition == HorizontalLegendPosition.end ? positionEnd : positionStart,
          height -
              axisStep * i * scale -
              (adjustedYOffset + (valuesPadding?.bottom ?? 0.0)) +
              (valuesPadding?.top ?? 0.0),
        ),
      );
    }

    if (dashArray != null) {
      canvas.drawPath(dashPath(gridPath, dashArray: dashArray!), paint);
    } else {
      canvas.drawPath(gridPath, paint);
    }

    _setUnitValue(canvas, size, state, scale);

    canvas.restore();
  }

  void _setUnitValue(Canvas canvas, Size size, ChartState state, double scale) {
    if (horizontalAxisUnit == null) {
      return;
    }

    final textPainter = _getTextPainter(horizontalAxisUnit, size: asFixedDecoration ? size : null);

    textPainter.paint(canvas, Offset.zero);
  }

  /// Get width of longest text on axis
  TextPainter _getTextPainter(String? text, {Size? size}) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: legendFontStyle),
      textScaler: TextScaler.linear(textScale),
      textAlign: valuesAlign,
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: size?.width ?? 0, maxWidth: size?.width ?? double.infinity);
    return textPainter;
  }

  @override
  EdgeInsets marginNeeded() {
    if (asFixedDecoration || !showValues) {
      return EdgeInsets.zero;
    }
    final painter = _getTextPainter(_longestText);
    final isEnd = legendPosition == HorizontalLegendPosition.end;

    final width = (painter.width + (valuesPadding?.horizontal ?? 0));

    return EdgeInsets.only(
      top: showTopValue ? (painter.height + (valuesPadding?.vertical ?? 0)) : 0.0,
      right: isEnd ? width : 0.0,
      left: isEnd ? 0.0 : width,
    );
  }

  @override
  HorizontalAxisDecoration animateTo(DecorationPainter endValue, double t) {
    if (endValue is HorizontalAxisDecoration) {
      return HorizontalAxisDecoration._lerp(
        showValues: t < 0.5 ? showValues : endValue.showValues,
        endWithChart: lerpDouble(_endWithChart, endValue._endWithChart, t) ?? endValue._endWithChart,
        showTopValue: t < 0.5 ? showTopValue : endValue.showTopValue,
        valuesAlign: t < 0.5 ? valuesAlign : endValue.valuesAlign,
        valuesPadding: EdgeInsets.lerp(valuesPadding, endValue.valuesPadding, t),
        lineColor: Color.lerp(lineColor, endValue.lineColor, t) ?? endValue.lineColor,
        lineWidth: lerpDouble(lineWidth, endValue.lineWidth, t) ?? endValue.lineWidth,
        dashArray: t < 0.5 ? dashArray : endValue.dashArray,
        axisStep: lerpDouble(axisStep, endValue.axisStep, t) ?? endValue.axisStep,
        textScale: lerpDouble(textScale, endValue.textScale, t) ?? endValue.textScale,
        legendFontStyle: TextStyle.lerp(legendFontStyle, endValue.legendFontStyle, t),
        showLineForValue: endValue.showLineForValue,
        horizontalAxisUnit: t > 0.5 ? endValue.horizontalAxisUnit : horizontalAxisUnit,
        legendPosition: t > 0.5 ? endValue.legendPosition : legendPosition,
        axisValue: t > 0.5 ? endValue.axisValue : axisValue,
        showLines: t > 0.5 ? endValue.showLines : showLines,
        asFixedDecoration: t > 0.5 ? endValue.asFixedDecoration : asFixedDecoration,
      );
    }

    return this;
  }
}
