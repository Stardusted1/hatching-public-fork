import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'package:hatching/utils/fonts.dart';
import 'package:mccounting_text/mccounting_text.dart';

class QuickAnalyticsWidget extends StatelessWidget {
  final AnalyticsItemDetails item;
  final TestSingleItem testItem;

  const QuickAnalyticsWidget({
    super.key,
    required this.item,
    required this.testItem,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("test_results".tr(), style: AppFonts.title3()),
            Text("results_description".tr(), style: AppFonts.textMedium16()),
            _buildOverallResult(),
            const Divider(),
            _buildResultRow(
              "accuracy".tr(),
              "${item.accuracy.toStringAsFixed(2)} %",
            ),
            _buildResultRow(
              "mean_accuracy".tr(),
              "${item.meanAccuracy.toStringAsFixed(2)} %",
            ),
            _buildResultRow(
              "total_errors".tr(),
              "${item.totalErrors} ${tr("pts")}.",
            ),
            _buildResultRow(
              "total_points".tr(),
              "${item.totalPoints} ${tr("pts")}.",
            ),
            _buildResultRow(
              "started_test".tr(),
              item.startTime.format("HH:mm:ss"),
            ),
            _buildResultRow(
              "finished_test".tr(),
              item.endTime.format("HH:mm:ss"),
            ),
            _buildResultRow(
              "duration".tr(),
              "${item.duration.inSeconds} ${tr("sec")} (${item.duration.inMilliseconds} ${tr("ms")})",
            ),
            _buildResultRow(
              "retries".tr(),
              "${item.totalRetries}",
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildOverallResult() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("overall_result".tr(), style: AppFonts.title4()),
          Row(
            children: [
              McCountingText(
                begin: 0,
                end: item.meanAccuracy,
                precision: 2,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                style: AppFonts.title4(),
              ),
              Text("%", style: AppFonts.title4()),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildResultRow(String title, String value, [TextStyle? textStyle]) {
    textStyle ??= AppFonts.textMedium();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppFonts.textMedium()),
          Text(value, style: AppFonts.textMedium()),
        ],
      ),
    );
  }
}

class QuickAnalyticsDecorator extends StatelessWidget {
  final QuickAnalyticsWidget child;

  const QuickAnalyticsDecorator({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [child],
      cancelButton: CupertinoActionSheetAction(
        child: Text("save".tr(), style: AppFonts.textMedium16(fontSize: 17)),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
