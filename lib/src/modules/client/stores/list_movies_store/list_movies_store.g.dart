// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListMovies on ListMoviesBase, Store {
  late final _$moviesAtom =
      Atom(name: 'ListMoviesBase.movies', context: context);

  @override
  List<MovieModel> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<MovieModel> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$loadAllMoviesAsyncAction =
      AsyncAction('ListMoviesBase.loadAllMovies', context: context);

  @override
  Future<dynamic> loadAllMovies() {
    return _$loadAllMoviesAsyncAction.run(() => super.loadAllMovies());
  }

  @override
  String toString() {
    return '''
movies: ${movies}
    ''';
  }
}
