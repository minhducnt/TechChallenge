part of '../../chart.dart';

/// Extended [ImplicitlyAnimatedWidget], that will animate the chart on every change of the [ChartState].
class AnimatedChart<T> extends ImplicitlyAnimatedWidget {
  /// Default constructor for animated chart [state] and [duration] are required
  const AnimatedChart({
    required this.state,
    required super.duration,
    this.height = 240.0,
    this.width,
    super.curve,
    super.onEnd,
    super.key,
  });

  /// Chart height
  final double height;

  /// Chart width
  final double? width;

  /// Current chart state
  final ChartState<T?> state;

  @override
  _ChartState<T> createState() => _ChartState<T>();

  /// Fill debug properties for animated chart
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ChartState<T?>>('state', state));
    properties.add(DiagnosticsProperty<double>('height', height));
    properties.add(DiagnosticsProperty<double>('width', width));
  }
}

class _ChartState<T> extends AnimatedWidgetBaseState<AnimatedChart<T>> {
  ChartStateTween<T>? _chartStateTween;
  Tween<double?>? _heightTween;
  Tween<double?>? _widthTween;

  @override
  Widget build(BuildContext context) {
    final chartState = (_chartStateTween?.evaluate(animation));

    if (chartState == null) {
      return SizedBox.shrink();
    }

    return _ChartWidget<T?>(
      width: _widthTween?.evaluate(animation),
      height: _heightTween?.evaluate(animation),
      state: chartState,
    );
  }

  @override
  void forEachTween(visitor) {
    _chartStateTween =
        visitor(_chartStateTween, widget.state, (dynamic value) => ChartStateTween<T>(begin: value as ChartState<T?>))
            as ChartStateTween<T>?;
    _heightTween =
        visitor(_heightTween, widget.height, (dynamic value) => Tween<double>(begin: value as double?))
            as Tween<double?>?;
    _widthTween =
        visitor(_widthTween, widget.width, (dynamic value) => Tween<double>(begin: value as double?))
            as Tween<double?>?;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<ChartStateTween>('state', _chartStateTween, defaultValue: null));
    description.add(DiagnosticsProperty<Tween<double?>>('height', _heightTween, defaultValue: null));
    description.add(DiagnosticsProperty<Tween<double?>>('width', _widthTween, defaultValue: null));
  }
}

/// Tween for animating between two different [ChartState]'s
class ChartStateTween<T> extends Tween<ChartState<T?>?> {
  /// Create [ChartStateTween] for [ImplicitlyAnimatedWidget]
  ChartStateTween({super.begin, super.end});

  @override
  ChartState<T?>? lerp(double t) {
    final begin = this.begin;
    final end = this.end;

    if (begin == null || end == null) {
      return begin ?? end;
    }

    return ChartState.lerp(begin, end, t);
  }
}
