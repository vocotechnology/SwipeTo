import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class PanGestureDetector extends StatelessWidget {
  final Widget? child;
  final HitTestBehavior? behavior;
  final bool excludeFromSemantics;
  final SemanticsGestureDelegate? semantics;
  final double? touchSlop;
  final GestureDragCancelCallback? onPanCancel;
  final GestureDragDownCallback? onPanDown;
  final GestureDragEndCallback? onPanEnd;
  final GestureDragStartCallback? onPanStart;
  final GestureDragUpdateCallback? onPanUpdate;

  const PanGestureDetector({
    super.key,
    this.child,
    this.behavior,
    this.excludeFromSemantics = false,
    this.semantics,
    this.touchSlop,
    this.onPanCancel,
    this.onPanDown,
    this.onPanEnd,
    this.onPanStart,
    this.onPanUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      behavior: behavior,
      excludeFromSemantics: excludeFromSemantics,
      semantics: semantics,
      gestures: {
        PanGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
          () => PanGestureRecognizer()
            ..gestureSettings = DeviceGestureSettings(touchSlop: touchSlop),
          (PanGestureRecognizer detector) {
            detector
              ..onDown = onPanDown
              ..onStart = onPanStart
              ..onUpdate = onPanUpdate
              ..onEnd = onPanEnd
              ..onCancel = onPanCancel;
          },
        )
      },
      child: child,
    );
  }
}
