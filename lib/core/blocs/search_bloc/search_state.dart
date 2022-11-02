part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<SearchResult> results;

  const SearchLoaded(this.results);

  @override
  List<Object> get props => [results];
}
