part of '../../../chart.dart';

/// Align chart data items in linear fashion. Meaning X axis cannot be changed. X axis becomes the index of current item
/// height of the item is defined by item max or min value.
class ChartLinearDataRenderer<T> extends ChartDataRenderer<T> {
  const ChartLinearDataRenderer(this.chartState, List<Widget> children, {super.key}) : super(children: children);

  final ChartState<T?> chartState;

  @override
  _ChartLinearItemRenderer<T?> createRenderObject(BuildContext context) {
    return _ChartLinearItemRenderer<T?>(chartState);
  }

  @override
  void updateRenderObject(BuildContext context, _ChartLinearItemRenderer<T?> renderObject) {
    renderObject.chartState = chartState;
    renderObject.markNeedsLayout();
  }
}

class ChartItemData extends ContainerBoxParentData<RenderBox> {}

class _ChartLinearItemRenderer<T> extends ChartItemRenderer<T>
    with
        ContainerRenderObjectMixin<RenderBox, ChartItemData>,
        RenderBoxContainerDefaultsMixin<RenderBox, ChartItemData> {
  _ChartLinearItemRenderer(super.chartState);

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! ChartItemData) {
      child.parentData = ChartItemData();
    }
  }

  @override
  bool get sizedByParent => false;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.biggest;
  }

  @override
  void performLayout() {
    var childCount = <int, int>{};
    var child = firstChild;
    final sizer = computeDryLayout(constraints);
    final listSize = _chartState.data.listSize;
    final itemSize = Size(sizer.width, sizer.height);

    // Final usable space for one item in the chart
    final itemWidth = itemSize.width / listSize;
    final offset = (parentData as BoxPaneParentData).offset;

    while (child != null) {
      final childParentData = child.parentData! as ChartItemData;

      if (child is _RenderLeafChartItem<T>) {
        final listIndex = child.listIndex;
        final currentValue = (childCount[listIndex] ?? 0).toInt();

        _setLeafChildPosition(
          child: child,
          size: sizer,
          offset: offset,
          itemWidth: itemWidth,
          currentValue: currentValue,
        );

        assert(child.parentData == childParentData);
        child = childParentData.nextSibling;
        childCount[listIndex] = currentValue + 1;
      } else if (child is _RenderChildChartItem<T>) {
        final listIndex = child.listIndex;
        final currentValue = (childCount[listIndex] ?? 0).toInt();

        _setWidgetChildPosition(
          child: child,
          size: sizer,
          offset: offset,
          itemWidth: itemWidth,
          currentValue: currentValue,
        );

        assert(child.parentData == childParentData);
        child = childParentData.nextSibling;
        childCount[listIndex] = currentValue + 1;
      }
    }

    size = sizer;
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    var child = firstChild;
    while (child != null) {
      final childParentData = child.parentData! as ChartItemData;
      context.paintChild(child, childParentData.offset + offset);
      child = childParentData.nextSibling;
    }
  }

  /// Set position and width for Leaf RenderBox widget, we don't need to constrain it's height it is calculated in [GeometryPainter]
  void _setLeafChildPosition({
    required _RenderLeafChartItem<T> child,
    required Offset offset,
    required double itemWidth,
    required Size size,
    required int currentValue,
  }) {
    final childParentData = child.parentData! as ChartItemData;

    // Get all necessary calculations for ChartItem for layout and position of the child.

    // In case we have multiple data and we have [WidgetItemOptions.multiValuePadding] set to true then
    // we need to add padding to the item, and change the starting offset.
    final multiValuePadding = chartState.itemOptions.multiValuePadding;

    // Animated multiValueStacked value (goes from 0.0 meaning no stack - to 1.0 stack)
    final stack = 1 - chartState.data.dataStrategy._stackMultipleValuesProgress;
    // How many items will we fit in the vertical space
    final stackSize = max(1.0, (chartState.data.stackSize) * stack);

    // Get available size for item. Subtracts set padding and divide by number of items we want to show
    final stackWidth =
        (itemWidth - (multiValuePadding.horizontal * stack) - (chartState.itemOptions.padding.horizontal * stackSize)) /
        stackSize;

    childParentData.offset =
        Offset(stackWidth * child.listIndex * stack, 0.0) +
        // Item offset in the list
        Offset(
          itemWidth * currentValue +
              (chartState.itemOptions.padding.horizontal * child.listIndex * stack) +
              chartState.itemOptions.padding.left,
          0,
        ) +
        // MultiValuePadding offset
        Offset(multiValuePadding.left * stack, 0.0);

    final innerConstraints = BoxConstraints.tightFor(width: stackWidth, height: size.height);

    child.layout(innerConstraints, parentUsesSize: true);
  }

  /// Set position and size of the child widget for [ChartItem]s
  ///
  /// Widget items are different and we have to constrain it's width and height, as well as setting
  /// the offset.
  ///
  /// Widget items also behave differently if current [ChartState.dataStrategy] is set to [StackDataStrategy]. In order to
  /// reduce overlap of the widgets bottom padding is added to widgets that are stacked.
  void _setWidgetChildPosition({
    required _RenderChildChartItem<T> child,
    required Size size,
    required Offset offset,
    required double itemWidth,
    required int currentValue,
  }) {
    final childParentData = child.parentData! as ChartItemData;

    // Get all necessary calculations for ChartItem for layout and position of the child.

    // Max value that is present in the chart
    final maxValue = chartState.data.maxValue - chartState.data.minValue;
    // Get current vertical multiplayer
    final verticalMultiplier = size.height / max(1, maxValue);
    // In case we have multiple data and we have [WidgetItemOptions.multiValuePadding] set to true then
    // we need to add padding to the item, and change the starting offset.
    final multiValuePadding = chartState.itemOptions.multiValuePadding;

    // Animated multiValueStacked value (goes from 0.0 meaning no stack - to 1.0 stack)
    final stack = 1 - chartState.data.dataStrategy._stackMultipleValuesProgress;
    // How many items will we fit in the vertical space
    final stackSize = max(1.0, (chartState.data.stackSize) * stack);

    // Get available size for item. Subtracts set padding and divide by number of items we want to show
    final stackWidth = (itemWidth - (multiValuePadding.horizontal * stack)) / stackSize;

    // For `StackDataStrategy` we will cut stacked items at the bottom, this will make sure there is no
    // Widget overlap for drawing, and make sure that centered widgets are in the center of visible item
    var bottomPaddingHeight = 0.0;

    childParentData.offset =
        offset + // Current chart offset
        // Item offset in the list
        Offset(itemWidth * currentValue, size.height - ((child.item.max ?? 0.0) * verticalMultiplier)) +
        // MultiValuePadding offset
        Offset(multiValuePadding.left * stack, 0);

    // Handle stack data strategy.
    if (chartState.data.dataStrategy is StackDataStrategy) {
      if (child.listIndex + 1 < chartState.data.stackSize) {
        bottomPaddingHeight = (chartState.data.items[child.listIndex + 1][currentValue].max ?? 0.0) * (1 - stack);
      }
    }

    final innerConstraints = BoxConstraints.tightFor(
      width: stackWidth,
      height: ((child.item.max ?? 0.0) * verticalMultiplier) - (bottomPaddingHeight * verticalMultiplier),
    );

    child.layout(innerConstraints, parentUsesSize: true);
  }
}
