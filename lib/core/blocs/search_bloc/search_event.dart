part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchByProvider extends SearchEvent {
  final SearchProvider provider;

  const SearchByProvider(this.provider);

  @override
  List<Object?> get props => throw UnimplementedError();
}
