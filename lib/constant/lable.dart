import 'package:flutter/widgets.dart';
import 'clip_shadow.dart';
import 'edge.dart';
import 'lable_clipper.dart';
export 'clip_shadow.dart' show ClipShadow;

class Label extends StatelessWidget {
  const Label(
      {Key? key,
      required this.triangleHeight,
      required this.child,
      this.edge = Edge.RIGHT,
      this.clipShadows = const []})
      : super(key: key);

  ///The widget which is going to be clipped as label shape
  final Widget child;

  ///The height of triangle that is going to be used to clip the [edge]
  final double triangleHeight;

  ///The edge that triangle clipping is going to be applied
  final Edge edge;

  ///List of shadows to be cast on the border
  final List<ClipShadow> clipShadows;

  @override
  Widget build(BuildContext context) {
    var clipper = LabelClipper(triangleHeight, edge);
    return CustomPaint(
      painter: ClipShadowPainter(clipper, clipShadows),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
