import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

class StackedAreaLineChart extends StatelessWidget {
  final List<Series<dynamic, num>> seriesList;
  final bool animate;

  const StackedAreaLineChart(this.seriesList, {this.animate = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: LineChart(
        seriesList,
        defaultRenderer: LineRendererConfig(
          includeArea: true,
          stacked: true,
          includePoints: true,
          radiusPx: 3,
          includeLine: true,
          strokeWidthPx: 0.5,
          areaOpacity: 0.2,
        ),
        animate: animate,
        animationDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}
