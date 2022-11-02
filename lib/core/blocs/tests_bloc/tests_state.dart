part of 'tests_bloc.dart';

abstract class TestsState extends Equatable {
  const TestsState();
}

class TestsLoading extends TestsState {
  @override
  List<Object> get props => [];
}

class TestsLoaded extends TestsState {
  final List<BaseTestItem> tests;

  const TestsLoaded(this.tests);

  @override
  List<Object?> get props => [tests];
}

class TestsLoadedSingle extends TestsState {
  final TestSingleItem test;

  const TestsLoadedSingle(this.test);

  @override
  List<Object?> get props => [test];
}

class TestsLoadingFailure extends TestsState {
  final String error;

  const TestsLoadingFailure(this.error);

  @override
  List<Object?> get props => [error];
}
