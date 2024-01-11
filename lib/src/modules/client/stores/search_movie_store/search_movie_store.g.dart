// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchMovieStore on _SearchMovieStoreBase, Store {
  late final _$searchQueryAtom =
      Atom(name: '_SearchMovieStoreBase.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$filteredResultsAtom =
      Atom(name: '_SearchMovieStoreBase.filteredResults', context: context);

  @override
  ObservableList<dynamic> get filteredResults {
    _$filteredResultsAtom.reportRead();
    return super.filteredResults;
  }

  @override
  set filteredResults(ObservableList<dynamic> value) {
    _$filteredResultsAtom.reportWrite(value, super.filteredResults, () {
      super.filteredResults = value;
    });
  }

  late final _$searchResultsAtom =
      Atom(name: '_SearchMovieStoreBase.searchResults', context: context);

  @override
  ObservableList<dynamic> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(ObservableList<dynamic> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  late final _$searchMoviesAsyncAction =
      AsyncAction('_SearchMovieStoreBase.searchMovies', context: context);

  @override
  Future<void> searchMovies(String query) {
    return _$searchMoviesAsyncAction.run(() => super.searchMovies(query));
  }

  late final _$_SearchMovieStoreBaseActionController =
      ActionController(name: '_SearchMovieStoreBase', context: context);

  @override
  void updateFilteredResults() {
    final _$actionInfo = _$_SearchMovieStoreBaseActionController.startAction(
        name: '_SearchMovieStoreBase.updateFilteredResults');
    try {
      return super.updateFilteredResults();
    } finally {
      _$_SearchMovieStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String query) {
    final _$actionInfo = _$_SearchMovieStoreBaseActionController.startAction(
        name: '_SearchMovieStoreBase.setSearchQuery');
    try {
      return super.setSearchQuery(query);
    } finally {
      _$_SearchMovieStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchQuery: ${searchQuery},
filteredResults: ${filteredResults},
searchResults: ${searchResults}
    ''';
  }
}
