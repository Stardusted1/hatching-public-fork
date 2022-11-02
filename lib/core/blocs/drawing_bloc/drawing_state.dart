part of 'drawing_cubit.dart';

abstract class DrawingState extends Equatable {
  const DrawingState();
}

class DrawingInitial extends DrawingState {
  @override
  List<Object> get props => [];
}

class DrawingEnded extends DrawingState {
  @override
  List<Object?> get props => [];
}

class DrawingConfirmed extends DrawingState {
  final AnalyticsItemDetails item;

  const DrawingConfirmed(this.item);

  @override
  List<Object?> get props => [item];
}

class DrawingCanceled extends DrawingState {
  @override
  List<Object?> get props => [];
}

class DrawingInProgress extends DrawingState {
  @override
  List<Object?> get props => [];
}

class DrawingFailure extends DrawingState {
  final String reason;

  const DrawingFailure(this.reason);

  @override
  List<Object?> get props => [reason];
}
