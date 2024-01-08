// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListMovies on ListMoviesBase, Store {
  Computed<List<MovieModel>>? _$moviesComputed;

  @override
  List<MovieModel> get movies =>
      (_$moviesComputed ??= Computed<List<MovieModel>>(() => super.movies,
              name: 'ListMoviesBase.movies'))
          .value;
  Computed<List<SerieModel>>? _$seriesComputed;

  @override
  List<SerieModel> get series =>
      (_$seriesComputed ??= Computed<List<SerieModel>>(() => super.series,
              name: 'ListMoviesBase.series'))
          .value;

  late final _$moviesFutureAtom =
      Atom(name: 'ListMoviesBase.moviesFuture', context: context);

  @override
  ObservableFuture<List<MovieModel>> get moviesFuture {
    _$moviesFutureAtom.reportRead();
    return super.moviesFuture;
  }

  @override
  set moviesFuture(ObservableFuture<List<MovieModel>> value) {
    _$moviesFutureAtom.reportWrite(value, super.moviesFuture, () {
      super.moviesFuture = value;
    });
  }

  late final _$seriesFutureAtom =
      Atom(name: 'ListMoviesBase.seriesFuture', context: context);

  @override
  ObservableFuture<List<SerieModel>> get seriesFuture {
    _$seriesFutureAtom.reportRead();
    return super.seriesFuture;
  }

  @override
  set seriesFuture(ObservableFuture<List<SerieModel>> value) {
    _$seriesFutureAtom.reportWrite(value, super.seriesFuture, () {
      super.seriesFuture = value;
    });
  }

  late final _$loadAllMoviesAsyncAction =
      AsyncAction('ListMoviesBase.loadAllMovies', context: context);

  @override
  Future<dynamic> loadAllMovies() {
    return _$loadAllMoviesAsyncAction.run(() => super.loadAllMovies());
  }

  late final _$loadAllSeriesAsyncAction =
      AsyncAction('ListMoviesBase.loadAllSeries', context: context);

  @override
  Future<void> loadAllSeries() {
    return _$loadAllSeriesAsyncAction.run(() => super.loadAllSeries());
  }

  @override
  String toString() {
    return '''
moviesFuture: ${moviesFuture},
seriesFuture: ${seriesFuture},
movies: ${movies},
series: ${series}
    ''';
  }
}
