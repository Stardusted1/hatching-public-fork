part of 'tests_bloc.dart';

abstract class TestsEvent extends Equatable {
  const TestsEvent();
}

class TestsLoad extends TestsEvent {
  @override
  List<Object?> get props => [];
}

class TestsOpen extends TestsEvent {
  final TestSingleItem test;

  const TestsOpen(this.test);

  @override
  List<Object?> get props => [test];
}
