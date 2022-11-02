import 'package:flutter/material.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/presentation/analytics_screen/analytics_list_item.dart';

class AnalyticsList extends StatelessWidget {
  final List<AnalyticsItem> items;

  const AnalyticsList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) => AnalyticsListItem(item: items[i]),
      itemCount: items.length,
    );
  }
}
