import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hatching/core/blocs/auth_cubit/auth_cubit.dart';
import 'package:hatching/core/blocs/drawing_bloc/drawing_cubit.dart';
import 'package:hatching/core/logger/logger.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'package:hatching/presentation/analytics_screen/quick_analytics_screen.dart';

import 'package:hatching/presentation/drawing_screen/deawing_canvas.dart';
import 'package:hatching/presentation/drawing_screen/drawing_buttons_row.dart';

class DrawingScreen extends StatefulWidget {
  final TestSingleItem test;

  const DrawingScreen({
    super.key,
    required this.test,
  });

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  @override
  Widget build(BuildContext context) => BlocProvider<DrawingCubit>(
        create: (_) => DrawingCubit(
          testId: widget.test,
          starter: widget.test.targetPath,
          userId: context.read<AuthCubit>().authUser!.uid,
        ),
        child: Builder(builder: (context) {
          return WillPopScope(
            onWillPop: () async =>
                context.read<DrawingCubit>().state is DrawingEnded ||
                context.read<DrawingCubit>().state is DrawingCanceled,
            child: BlocListener<DrawingCubit, DrawingState>(
              listener: _blocListener,
              child: Scaffold(
                backgroundColor: Colors.black,
                body: buildBody(context),
              ),
            ),
          );
        }),
      );

  Widget buildBody(BuildContext context) => Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.string(
              widget.test.testJson,
              fit: BoxFit.cover,
              color: Colors.white,
            ),
          ),
          Container(color: Colors.transparent, child: const DrawingCanvas()),
          _buildBottomButtons(context)
        ],
      );

  Align _buildBottomButtons(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<DrawingCubit, DrawingState>(
            builder: (context, state) => DrawingButtonsRow(
              canExit: state is DrawingEnded,
              onConfirm: () => context.read<DrawingCubit>().confirmTest(),
              onCancel: () => context.read<DrawingCubit>().cancelTest(),
              onRestart: () => context.read<DrawingCubit>().restartTest(),
            ),
          ),
        ),
      );

  void _blocListener(context, DrawingState state) {
    if (state is DrawingFailure) {
      Logger.m(state.reason);
    } else if (state is DrawingConfirmed) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => QuickAnalyticsDecorator(
          child: QuickAnalyticsWidget(
            item: state.item,
            testItem: widget.test,
          ),
        ),
      );
    } else if (state is DrawingCanceled) {
      Navigator.maybePop(context);
    }
  }
}
