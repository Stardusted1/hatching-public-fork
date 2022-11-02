import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hatching/data/repositories/analytics_repository/analytics_repository.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';

part 'analytics_bloc_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  AnalyticsCubit() : super(AnalyticsLoading());

  IAnalyticsRepository repository = Get.find<IAnalyticsRepository>();

  void loadItems() async {
    emit(AnalyticsLoading());
    try {
      final items = await repository
          .fetchAnalytics(FirebaseAuth.instance.currentUser!.uid);
      emit(AnalyticsLoaded(items));
    } catch (e, s) {
      emit(AnalyticsFailure("$e\n$s"));
    }
  }
}
