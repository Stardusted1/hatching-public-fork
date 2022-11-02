part of 'analytics_bloc_cubit.dart';

abstract class AnalyticsState extends Equatable {
  const AnalyticsState();
}

class AnalyticsLoading extends AnalyticsState {
  @override
  List<Object> get props => [];
}

class AnalyticsLoaded extends AnalyticsState {
  final List<AnalyticsItem> items;

  const AnalyticsLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class AnalyticsFailure extends AnalyticsState {
  final String error;

  const AnalyticsFailure(this.error);

  @override
  List<Object> get props => [error];
}
