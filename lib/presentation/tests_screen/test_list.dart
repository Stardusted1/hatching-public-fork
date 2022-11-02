import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatching/core/blocs/tests_bloc/tests_bloc.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'package:hatching/presentation/tests_screen/test_card_list_item.dart';
import 'package:hatching/presentation/tests_screen/test_list_item.dart';

class TestList extends StatefulWidget {
  final List<BaseTestItem> items;

  const TestList({super.key, required this.items});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  late final widgets = widget.items.map((e) {
    if (e is TestSingleItem) {
      return SingleTestListItem(item: e, onTestPressed: _onTestPressed);
    } else if (e is TestMultipleItems) {
      return TestCardItem(item: e, onTestPressed: _onTestPressed);
    }
    return Container();
  }).toList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widgets.length,
      itemBuilder: (context, index) {
        return widgets[index];
      },
    );
  }

  void _onTestPressed(TestSingleItem test) {
    BlocProvider.of<TestsBloc>(context).add(TestsOpen(test));
  }
}
