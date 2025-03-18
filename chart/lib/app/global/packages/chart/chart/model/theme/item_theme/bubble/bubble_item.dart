part of '../../../../../chart.dart';

class BubbleItem extends DrawDataItem {
  const BubbleItem({super.gradient, super.border, super.color});

  BubbleItem lerp(BubbleItem endValue, double t) {
    return BubbleItem(
      gradient: Gradient.lerp(gradient, endValue is BubbleItemOptions ? endValue.gradient : null, t),
      border: BorderSide.lerp(border, endValue is BubbleItemOptions ? (endValue.border) : BorderSide.none, t),
      color: Color.lerp(color, endValue.color, t),
    );
  }

  @override
  List<Object?> get props => [gradient, border, color];
}

class BubbleItemBuilderLerp {
  static BubbleItemBuilder lerp(BubbleItemOptions a, BubbleItemOptions b, double t) {
    return (ItemBuilderData data) {
      final aItem = a.bubbleItemBuilder(data);
      final bItem = b.bubbleItemBuilder(data);
      return aItem.lerp(bItem, t);
    };
  }
}
