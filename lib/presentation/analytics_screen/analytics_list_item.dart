import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/presentation/components/line_chart.dart';
import 'package:hatching/presentation/tests_screen/test_list_trailing.dart';
import 'package:hatching/utils/fonts.dart';
import 'package:charts_flutter/flutter.dart';

class AnalyticsListItem extends StatefulWidget {
  final AnalyticsItem item;

  const AnalyticsListItem({super.key, required this.item});

  @override
  State<AnalyticsListItem> createState() => _AnalyticsListItemState();
}

class _AnalyticsListItemState extends State<AnalyticsListItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.only(left: 10),
          backgroundColor: Colors.grey[200],
          onExpansionChanged: (expanded) =>
              setState(() => _expanded = expanded),
          trailing: TestCardTrailing(
            expanded: _expanded,
            itemsCount: 0,
          ),
          title: Text(
            widget.item.name,
            style: AppFonts.textMedium(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            widget.item.description,
            style: AppFonts.textMedium(fontWeight: FontWeight.w500),
          ),
          children: [
            AnalyticsListItemContent(item: widget.item),
          ],
        ),
      ),
    );
  }
}

class AnalyticsListItemContent extends StatelessWidget {
  final AnalyticsItem item;

  const AnalyticsListItemContent({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Text("successful_tests".tr(), style: AppFonts.title4(fontSize: 14)),
          _successfulTests(),
          Text("unsuccessful_tests".tr(), style: AppFonts.title4(fontSize: 14)),
          _unsuccessfulTests(),
          _overallPieCharts(),
          _buildTextRow("retries".tr(), "${item.data.length}"),
          _buildTextRow(
            "mean_duration".tr(),
            "${item.getMeanDuration} ${"sec".tr()}",
          ),
          Row(
            children: [
              Expanded(
                child: _buildButton("download_pdf".tr(), () => _dummy(context)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildButton("share_to_web".tr(), () => _dummy(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _overallPieCharts() {
    return SizedBox(
      height: 150,
      child: PieChart<String>(
        [
          Series<Data, String>(
            id: 'scope',
            domainFn: (Data sales, _) => sales.x,
            measureFn: (Data sales, _) => sales.y,
            data: item.getScopedDetails,
            labelAccessorFn: (Data row, _) => '${row.x}: ${row.y}',
          )
        ],
        animate: true,
        animationDuration: kThemeAnimationDuration,
        defaultRenderer: ArcRendererConfig(
          arcWidth: 25,
          arcRendererDecorators: List.generate(
            item.getScopedDetails.length,
            (_) => ArcLabelDecorator(
              labelPosition: ArcLabelPosition.outside,
              showLeaderLines: true,
              leaderLineColor: Color.black,
            ),
          ),
        ),
      ),
    );
  }

  StackedAreaLineChart _unsuccessfulTests() {
    return StackedAreaLineChart([
      Series<Data, int>(
        id: 'unsuccessful',
        colorFn: (_, __) => MaterialPalette.red.shadeDefault,
        domainFn: (Data sales, _) => sales.x,
        measureFn: (Data sales, _) => sales.y,
        data: item.getUnsuccessfulSamples,
      ),
    ]);
  }

  StackedAreaLineChart _successfulTests() {
    return StackedAreaLineChart([
      Series<Data, int>(
        id: 'successful',
        colorFn: (_, __) => MaterialPalette.green.shadeDefault,
        domainFn: (Data sales, _) => sales.x,
        measureFn: (Data sales, _) => sales.y,
        data: item.getSuccessfulSamples,
      ),
    ]);
  }
}

void _dummy(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text("TODO"),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        label: "got it",
        onPressed: () {},
      ),
    ),
  );
}

ElevatedButton _buildButton(String text, [VoidCallback? onPressed]) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Text(
      text,
      style: AppFonts.textMedium(color: Colors.white),
    ),
    onPressed: onPressed ?? () {},
  );
}

Widget _buildTextRow(String text, String value) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppFonts.textMedium()),
          Text(value, style: AppFonts.textMedium()),
        ],
      ),
    );
