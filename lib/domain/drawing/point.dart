import 'package:flutter/cupertino.dart';

class FigurePoint {
  final double x;
  final double y;

  FigurePoint(this.x, this.y);

  FigurePoint.fromOffset(Offset offset)
      : x = offset.dx,
        y = offset.dy;

  Offset toOffset() => Offset(x, y);
}
