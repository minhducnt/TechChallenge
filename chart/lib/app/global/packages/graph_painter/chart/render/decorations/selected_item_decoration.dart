part of '../../../chart.dart';

/// Show selected item in Cupertino style (Health app)
class SelectedItemDecoration extends DecorationPainter {
  /// Constructor for selected item decoration
  SelectedItemDecoration(
    this.selectedItem, {
    this.selectedColor = Colors.red,
    this.backgroundColor = Colors.grey,
    this.selectedStyle = const TextStyle(fontSize: 13.0),
    this.animate = false,
    bool showText = true,
    this.showOnTop = true,
    this.selectedListIndex = 0,
    this.child,
    this.topMargin = 0.0,
  }) : showText = showText && (child == null);

  /// Index of selected item
  final int? selectedItem;

  /// Color of selected indicator and text background
  final Color selectedColor;

  /// Color for selected item, this color is shown as overlay, use with alpha!
  final Color backgroundColor;

  /// Should [selectedItem] animate from one item to next
  final bool animate;

  final bool showText;

  final bool showOnTop;

  /// Color of selected item text
  final TextStyle selectedStyle;

  /// Child to show on top or bottom of selected item
  final Widget? child;
  final double topMargin;

  /// Index of list whose data to show
  /// By default it will use first list to this value will be `0`
  final int selectedListIndex;

  @override
  Widget getRenderer(ChartState state) {
    if (child != null) {
      return ChartDecorationChildRenderer(state, this, child!);
    }

    return super.getRenderer(state);
  }

  @override
  void initDecoration(ChartState state) {
    super.initDecoration(state);
    assert(
      state.data.stackSize > selectedListIndex,
      'Selected list index is not in the list!\nCheck the `selectedListIndex` you are passing.',
    );
  }

  @override
  Size layoutSize(BoxConstraints constraints, ChartState state) {
    final listSize = state.data.listSize;
    final itemWidth = constraints.deflate(state.defaultMargin).maxWidth / listSize;

    return Size(itemWidth, constraints.deflate(state.defaultMargin - marginNeeded()).maxHeight);
  }

  @override
  Offset applyPaintTransform(ChartState state, Size size) {
    final width = (size.width - state.defaultMargin.horizontal) / state.data.listSize;

    final selectedItem = this.selectedItem;
    if (selectedItem != null) {
      final selectedItemMax = state.data.items[selectedListIndex][selectedItem].max ?? 0.0;
      final selectedItemMin = state.data.items[selectedListIndex][selectedItem].min ?? 0.0;

      final maxValue = state.data.maxValue - state.data.minValue;
      final height = size.height - marginNeeded().vertical;
      final scale = height / maxValue;

      return Offset(
        state.defaultMargin.left + width * selectedItem,
        showOnTop
            ? (state.defaultMargin - marginNeeded()).top
            : size.height - ((selectedItemMax - (min(selectedItemMin, state.data.minValue))) * scale),
      );
    }

    return Offset.zero;
  }

  void _drawText(Canvas canvas, Size size, double totalWidth, ChartState state) {
    final item = this.selectedItem;
    if (item == null) {
      return;
    }
    final width = size.width;
    final selectedItem = state.data.items[selectedListIndex][item];

    // Create a TextPainter for the max value
    final maxValuePainter = ValueDecoration.makeTextPainter(
      selectedItem.max?.toStringAsFixed(2) ?? '',
      width,
      selectedStyle,
      hasMaxWidth: false,
    );

    // Ensure enough width for the text
    final itemWidth = max(
      state.itemOptions.minBarWidth ?? 0.0,
      min(state.itemOptions.maxBarWidth ?? double.infinity, size.width - state.itemOptions.padding.horizontal),
    );

    const size0 = 2.0;
    final maxValue = state.data.maxValue - state.data.minValue;
    final height = size.height - marginNeeded().vertical;
    final scale = height / maxValue;

    final itemMaxValue = selectedItem.max ?? 0.0;
    final itemMinValue = selectedItem.min ?? 0.0;

    // If the item is empty or its max value is below the chart's minValue, don't draw it
    if (selectedItem.isEmpty || itemMaxValue < state.data.minValue) {
      return;
    }

    // Draw the rectangle for the selected item
    if (itemMinValue != 0.0) {
      canvas.drawRect(
        Rect.fromPoints(
          Offset(state.itemOptions.padding.left + itemWidth / 2 - size0 / 2, 0.0),
          Offset(state.itemOptions.padding.left + itemWidth / 2 + size0 / 2, (itemMaxValue - itemMinValue) * scale),
        ),
        Paint()..color = selectedColor,
      );
    }

    if (showOnTop) {
      _drawLine(canvas, size, state);
    }

    // Draw the rounded rectangle for the text background
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(
            width / 2 - maxValuePainter.width / 2,
            ((size.height -
                        ((itemMaxValue - (min(itemMinValue, state.data.minValue))) * scale) -
                        (selectedStyle.fontSize ?? 0.0) * 1.4) *
                    (showOnTop ? 0 : 1)) +
                ((showOnTop ? 1 : 0) * (selectedStyle.fontSize ?? 0.0) * 1.4),
          ),
          Offset(
            width / 2 + maxValuePainter.width / 2,
            ((size.height -
                        ((itemMaxValue - (min(itemMinValue, state.data.minValue))) * scale) -
                        (selectedStyle.fontSize ?? 0.0) * 0.4) *
                    (showOnTop ? 0 : 1)) +
                ((showOnTop ? 1 : 0) * (selectedStyle.fontSize ?? 0.0) * 0.4),
          ),
        ),
        const Radius.circular(8.0),
      ).inflate(4),
      Paint()..color = selectedColor,
    );

    // Paint the text
    maxValuePainter.paint(
      canvas,
      Offset(
        width / 2 - maxValuePainter.width / 2,
        ((size.height -
                    ((itemMaxValue - (min(itemMinValue, state.data.minValue))) * scale) -
                    (selectedStyle.fontSize ?? 0.0) * 1.4) *
                (showOnTop ? 0 : 1)) +
            ((showOnTop ? 1 : 0) * (selectedStyle.fontSize ?? 0.0) * 0.4),
      ),
    );
  }

  void _drawLine(Canvas canvas, Size size, ChartState state) {
    final item = this.selectedItem;
    if (item == null) {
      return;
    }
    final selectedItem = state.data.items[selectedListIndex][item];

    final itemWidth = max(
      state.itemOptions.minBarWidth ?? 0.0,
      min(state.itemOptions.maxBarWidth ?? double.infinity, size.width - state.itemOptions.padding.horizontal),
    );

    const size0 = 2.0;
    final maxValue = state.data.maxValue - state.data.minValue;
    final height = size.height - marginNeeded().vertical;
    final scale = height / maxValue;

    final itemMaxValue = selectedItem.max ?? 0.0;
    final itemMinValue = selectedItem.min ?? 0.0;

    canvas.drawRect(
      Rect.fromPoints(
        Offset(state.itemOptions.padding.left + itemWidth / 2 - size0 / 2, (selectedStyle.fontSize ?? 0.0) * 1.4),
        Offset(
          state.itemOptions.padding.left + itemWidth / 2 + size0 / 2,
          size.height - ((itemMaxValue - (min(itemMinValue, state.data.minValue))) * scale),
        ),
      ),
      Paint()..color = selectedColor,
    );
  }

  @override
  void draw(Canvas canvas, Size size, ChartState state) {
    if (child != null) {
      return;
    }

    final listSize = state.data.listSize;
    final item = selectedItem;

    if (item == null || listSize <= item || item.isNegative) {
      return;
    }
    _drawItem(canvas, size, state);

    if (showText) {
      _drawText(canvas, size, size.width, state);
    }

    // Restore canvas
    canvas.restore();
  }

  void _drawItem(Canvas canvas, Size size, ChartState state) {
    canvas.drawRect(
      Rect.fromPoints(Offset(0.0, marginNeeded().top), Offset(size.width, size.height)),
      Paint()
        ..color = backgroundColor
        ..blendMode = BlendMode.overlay,
    );
  }

  @override
  EdgeInsets marginNeeded() {
    return EdgeInsets.only(
      top: showOnTop
          ? (showText
              ? (selectedStyle.fontSize ?? 0) * 1.8
              : child != null
                  ? topMargin
                  : 0.0)
          : 0.0,
    );
  }

  @override
  DecorationPainter animateTo(DecorationPainter endValue, double t) {
    if (endValue is SelectedItemDecoration) {
      return SelectedItemDecoration(
        animate
            ? (lerpDouble(selectedItem?.toDouble(), endValue.selectedItem?.toDouble(), t) ?? 0).round()
            : endValue.selectedItem,
        selectedColor: Color.lerp(selectedColor, endValue.selectedColor, t) ?? endValue.selectedColor,
        backgroundColor: Color.lerp(backgroundColor, endValue.backgroundColor, t) ?? endValue.backgroundColor,
        selectedStyle: TextStyle.lerp(selectedStyle, endValue.selectedStyle, t) ?? endValue.selectedStyle,
        animate: endValue.animate,
        selectedListIndex: endValue.selectedListIndex,
        showOnTop: t < 0.5 ? showOnTop : endValue.showOnTop,
        showText: t < 0.5 ? showText : endValue.showText,
        child: t < 0.5 ? child : endValue.child,
        topMargin: lerpDouble(topMargin, endValue.topMargin, t) ?? 0.0,
      );
    }

    return this;
  }
}
