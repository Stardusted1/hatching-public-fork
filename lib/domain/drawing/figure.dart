import 'package:hatching/domain/drawing/point.dart';

class Figure {
  final List<FigurePoint> points;
  final FigurePoint start;
  final FigurePoint end;

  Figure({
    required this.points,
    required this.start,
    required this.end,
  });
}
