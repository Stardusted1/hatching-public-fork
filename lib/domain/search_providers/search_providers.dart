import 'package:flutter/widgets.dart';

abstract class SearchProvider {
  List<SearchResult> performSearch(List<SearchableItem> items);
}

abstract class SearchResult {
  Widget buildSearchResult();
}

class SearchProviderText implements SearchProvider {
  final String query;

  const SearchProviderText(this.query);

  @override
  List<SearchResult> performSearch(List<SearchableItem> items) {
    throw UnimplementedError();
  }
}

class SearchProviderTag implements SearchProvider {
  final SearchTag tag;

  const SearchProviderTag(this.tag);

  @override
  List<SearchResult> performSearch(List<SearchableItem> items) {
    throw UnimplementedError();
  }
}

class SearchableItem {
  final String text;
  final String tag;

  SearchableItem({
    required this.text,
    required this.tag,
  });
}

class SearchTag {
  final Icon icon;
  final String tag;

  SearchTag(this.icon, this.tag);
}

class SearchText {
  final String text;

  SearchText(this.text);
}
