part of '../../../chart.dart';

typedef ValueFromItem = double Function(ChartItem item);
typedef LabelFromItem = String Function(ChartItem item);

double defaultValueForItem(ChartItem item) => item.max ?? 0.0;

/// Draw value of the items on them.
/// Use this only as [ChartState.foregroundDecorations] in order to be visible at all locations
/// Exact alignment can be set with [alignment]
@Deprecated('Use [WidgetItemBuilder] instead if you want to decorate chart items with text')
class ValueDecoration extends DecorationPainter {
  /// Constructor for values decoration
  ValueDecoration({
    this.textStyle,
    this.alignment = Alignment.topCenter,
    this.listIndex = 0,
    this.valueGenerator = defaultValueForItem,
    this.hideZeroValues = false,
    this.labelGenerator,
  });

  /// Style for values to use
  final TextStyle? textStyle;

  /// Alignment of the text based on item
  final Alignment alignment;

  final ValueFromItem valueGenerator;

  /// Generate a custom label that is used.
  ///
  /// By default it will display the output from [valueGenerator] parsed to an int
  final LabelFromItem? labelGenerator;

  /// Index of list in items, this is used if there are multiple lists in the chart
  ///
  /// By default this will show first list and value will be 0
  final int listIndex;
  final bool hideZeroValues;

  @override
  DecorationPainter animateTo(DecorationPainter endValue, double t) {
    if (endValue is ValueDecoration) {
      return ValueDecoration(
        textStyle: TextStyle.lerp(textStyle, endValue.textStyle, t),
        alignment: Alignment.lerp(alignment, endValue.alignment, t) ?? endValue.alignment,
        listIndex: endValue.listIndex,
        valueGenerator: endValue.valueGenerator,
      );
    }
    return this;
  }

  @override
  bool isSameType(DecorationPainter other) {
    if (other is ValueDecoration) {
      return other.valueGenerator == valueGenerator;
    }

    return false;
  }

  @override
  void initDecoration(ChartState state) {
    super.initDecoration(state);
    assert(state.data.stackSize > listIndex, 'List index is not in the list!\nCheck the `listIndex` you are passing.');
  }

  void _paintText(Canvas canvas, Size size, ChartItem item, double width, double verticalMultiplier, double minValue) {
    final itemMaxValue = valueGenerator(item);

    final maxValuePainter = ValueDecoration.makeTextPainter(
      labelGenerator?.call(item) ?? '${itemMaxValue.toInt()}',
      width,
      textStyle,
    );

    maxValuePainter.paint(
      canvas,
      Offset(
        width * alignment.x,
        size.height -
            itemMaxValue * verticalMultiplier +
            minValue * verticalMultiplier -
            maxValuePainter.height * 0.5 +
            (maxValuePainter.height * alignment.y),
      ),
    );
  }

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
    final maxValue = state.data.maxValue - state.data.minValue;
    final verticalMultiplier = size.height / max(1, maxValue);

    final listSize = state.data.listSize;
    final itemWidth = size.width / listSize;

    state.data.items[listIndex].asMap().forEach((index, value) {
      if (hideZeroValues && (value.max ?? 0) == 0 && (value.min ?? 0) == 0) {
        return;
      }

      canvas.save();
      canvas.translate(index * itemWidth, 0.0);
      _paintText(
        canvas,
        Size(index * itemWidth, size.height),
        value,
        itemWidth,
        verticalMultiplier,
        state.data.minValue,
      );
      canvas.restore();
    });
  }

  /// Get default text painter with set [value]
  /// Helper for [_paintText]
  static TextPainter makeTextPainter(String value, double width, TextStyle? style, {bool hasMaxWidth = true}) {
    final painter = TextPainter(
      text: TextSpan(text: value, style: style),
      textAlign: TextAlign.center,
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    if (hasMaxWidth) {
      painter.layout(maxWidth: width, minWidth: width);
    } else {
      painter.layout(minWidth: width);
    }

    return painter;
  }
}
