import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatching/core/blocs/drawing_bloc/drawing_cubit.dart';
import 'package:hatching/domain/drawing/point.dart';

class DrawingCanvas extends StatefulWidget {
  const DrawingCanvas({super.key});

  @override
  _DrawingCanvasState createState() => _DrawingCanvasState();
}

class _DrawingCanvasState extends State<DrawingCanvas> {
  final List<Offset> _points = [];
  bool _canDraw = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrawingCubit, DrawingState>(
      listener: (context, state) {
        _canDraw = state is DrawingInitial;
        if (state is DrawingInitial) {
          _points.clear();
        }
      },
      child: GestureDetector(
        onPanStart: (details) {
          if (!_canDraw) return;
          context.read<DrawingCubit>().startDrawing();
        },
        onPanUpdate: (DragUpdateDetails details) {
          if (!_canDraw) return;
          setState(() => _points.add(details.localPosition));
        },
        onPanEnd: (details) {
          if (!_canDraw) return;
          context
              .read<DrawingCubit>()
              .endDrawing(_points.map(FigurePoint.fromOffset).toList());
        },
        child: CustomPaint(
          key: GlobalKey(),
          isComplex: true,
          willChange: true,
          painter: Signature(points: _points),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class Signature extends CustomPainter {
  List<Offset> points;
  Paint pointer = Paint()
    ..color = Colors.pink
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;
  Path path = Path();

  Signature({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) {
      return;
    } else if (points.length >= 2) {
      for (int i = 0; i < points.length - 2; i++) {
        canvas.drawLine(points[i], points[i + 1], pointer);
      }
    }
  }

  @override
  bool shouldRepaint(covariant Signature oldDelegate) {
    return oldDelegate.points.length <= points.length;
  }
}
