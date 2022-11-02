import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatching/core/blocs/auth_cubit/auth_cubit.dart';
import 'package:hatching/core/blocs/tests_bloc/tests_bloc.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'package:hatching/presentation/drawing_screen/drawing_screen.dart';
import 'package:hatching/presentation/tests_screen/test_list.dart';
import 'package:hatching/utils/resourses.dart';
import 'package:hatching/utils/snackbar_utils.dart';
import 'package:lottie/lottie.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({super.key});

  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestsBloc()..add(TestsLoad()),
      child: BlocConsumer<TestsBloc, TestsState>(
        listener: (context, state) {
          if (state is TestsLoadedSingle) {
            pushTestScreen(context, state.test);
          } else if (state is TestsLoadingFailure) {
            context.showErrorBanner(title: state.error);
          }
        },
        buildWhen: (previous, current) => {
          TestsLoaded,
          TestsLoading,
        }.contains(current.runtimeType),
        builder: (context, state) {
          if (state is TestsLoaded) {
            return TestList(items: state.tests);
          } else if (state is TestsLoading) {
            return Center(
              child: Lottie.asset(
                AppAnimations.loading,
                frameRate: FrameRate(60),
                repeat: true,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  void pushTestScreen(BuildContext context, TestSingleItem test) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<AuthCubit>(),
          child: DrawingScreen(test: test),
        ),
      ),
    );
  }
}
