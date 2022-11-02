import 'package:flutter/material.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'package:hatching/presentation/tests_screen/test_list_item.dart';
import 'package:hatching/presentation/tests_screen/test_list_trailing.dart';
import 'package:hatching/utils/fonts.dart';

class TestCardItem extends StatefulWidget {
  final TestMultipleItems item;
  final Function(TestSingleItem test) onTestPressed;

  const TestCardItem({
    super.key,
    required this.item,
    required this.onTestPressed,
  });

  @override
  _TestCardItemState createState() => _TestCardItemState();
}

class _TestCardItemState extends State<TestCardItem> {
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
            itemsCount: widget.item.items.length,
          ),
          title: Text(
            widget.item.name,
            style: AppFonts.textMedium(fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            widget.item.description,
            style: AppFonts.textMedium(fontWeight: FontWeight.w500),
          ),
          children: widget.item.items
              .cast<TestSingleItem>()
              .map(
                (e) => SingleTestListItem(
                  item: e,
                  onTestPressed: widget.onTestPressed,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
