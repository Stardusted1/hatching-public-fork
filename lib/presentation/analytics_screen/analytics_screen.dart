import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatching/core/blocs/analytics_bloc/analytics_bloc_cubit.dart';
import 'package:hatching/presentation/analytics_screen/analytics_list.dart';
import 'package:hatching/utils/resourses.dart';
import 'package:hatching/utils/snackbar_utils.dart';
import 'package:lottie/lottie.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  AnalyticsCubit bloc = AnalyticsCubit();

  @override
  void initState() {
    bloc.loadItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<AnalyticsCubit, AnalyticsState>(
        listener: (context, state) {
          if (state is AnalyticsFailure) {
            context.showErrorBanner(title: state.error);
          }
        },
        buildWhen: (previous, current) => {
          AnalyticsLoading,
          AnalyticsLoaded,
        }.contains(current.runtimeType),
        builder: (context, state) {
          if (state is AnalyticsLoading) {
            return Center(
              child: Lottie.asset(
                AppAnimations.loading,
                repeat: true,
                frameRate: FrameRate(60),
              ),
            );
          } else if (state is AnalyticsLoaded) {
            return AnalyticsList(items: state.items);
          }
          return Center(
            child: Text(state.toString()),
          );
        },
      ),
    );
  }
}
