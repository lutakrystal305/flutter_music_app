import 'package:flutter/cupertino.dart';

class MyFlowDelegate extends FlowDelegate {
  MyFlowDelegate(this.animation) : super(repaint: animation);
  final Animation<double> animation;
  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    double dy = 0.0;
    for (int i = 0; i < context.childCount; i++) {
      //final offset = 1 * animation.value * 50;
      dx = context.getChildSize(i)!.width * i;
      dy = context.getChildSize(i)!.height * i;
      context.paintChild(i,
          transform: Matrix4.translationValues(
              -dx * animation.value / 7, -dy * animation.value / 15, 0));
    }
  }

  @override
  bool shouldRepaint(MyFlowDelegate oldDelegate) =>
      animation != oldDelegate.animation;
}
