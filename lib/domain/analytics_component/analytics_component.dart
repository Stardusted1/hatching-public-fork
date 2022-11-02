import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/domain/drawing/point.dart';

class AnalyticsComponent {
  late TargetPoints _picture;
  late List<FigurePoint> _target;

  void init({
    required TargetPoints picture,
    required List<FigurePoint> target,
  }) {
    _picture = picture;
    _target = target;
  }

  AnalyticsItemDetails performAnalytics({
    required DateTime endTime,
    required DateTime startTime,
    required int totalRetries,
  }) {
    final correctPoints = _target.fold<int>(
      0,
      (value, point) => _picture.contains(point) ? value++ : value,
    );
    final Random random = Random(DateTime.now().millisecond);
    const minimum = 80;
    const maximum = 100;
    const delta = 10;
    return AnalyticsItemDetails(
      accuracy: (correctPoints + 1) / _target.length,
      meanAccuracy: (correctPoints + 1) / _target.length,
      duration: endTime.difference(startTime),
      startTime: startTime,
      endTime: endTime,
      totalPoints: _target.length,
      totalErrors: _target.length - correctPoints,
      totalRetries: totalRetries,
    );
  }
}

abstract class TargetPoints {
  bool contains(FigurePoint point);
}

class FlutterPathToTargetPointsAdapter implements TargetPoints {
  final Path path;

  FlutterPathToTargetPointsAdapter(this.path);

  @override
  bool contains(FigurePoint point) => path.contains(point.toOffset());
}
