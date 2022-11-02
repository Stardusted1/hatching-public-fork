import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hatching/domain/search_providers/search_providers.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchLoading()) {
    on<SearchByProvider>((event, emit) {});
  }
}
