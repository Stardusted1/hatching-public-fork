import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:hatching/data/repositories/analytics_repository/analytics_repository.dart';
import 'package:hatching/domain/analytics_component/analytics_component.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/domain/drawing/point.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';

part 'drawing_state.dart';

class DrawingCubit extends Cubit<DrawingState> {
  DrawingCubit({
    required this.testId,
    required this.starter,
    required this.userId,
  }) : super(DrawingInitial());
  final TestSingleItem testId;
  final Path starter;
  final String userId;
  final resultPath = Path();

  IAnalyticsRepository repository = Get.find<IAnalyticsRepository>();
  AnalyticsComponent analytics = AnalyticsComponent();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  int totalRetries = 1;

  void endDrawing(List<FigurePoint> points) {
    // for (var element in points) {
    //   resultPath.moveTo(element.x, element.y);
    // }
    analytics.init(
      picture: FlutterPathToTargetPointsAdapter(starter),
      target: points,
    );
    endTime = DateTime.now();
    emit(DrawingEnded());
  }

  void restartTest() {
    startTime = DateTime.now();
    totalRetries++;
    emit(DrawingInitial());
  }

  void confirmTest() async {
    final item = analytics.performAnalytics(
      endTime: endTime,
      startTime: startTime,
      totalRetries: totalRetries,
    );

    await repository.sendAnalytics(
      testId,
      item,
      userId,
    );
    emit(DrawingConfirmed(item));
  }

  void cancelTest() {
    endTime = DateTime.now();
    emit(DrawingCanceled());
  }

  void startDrawing() {
    startTime = DateTime.now();
  }
}
