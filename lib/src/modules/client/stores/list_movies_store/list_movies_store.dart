import 'package:flutter_flix_project_4/src/core/service/dio_service.dart';
import 'package:flutter_flix_project_4/src/modules/client/models/movie_model.dart';
import 'package:flutter_flix_project_4/src/modules/client/models/serie_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'list_movies_store.g.dart';

class ListMovies = ListMoviesBase with _$ListMovies;

abstract class ListMoviesBase with Store{
  final _dioService = Modular.get<DioService>();

  @observable
  ObservableFuture<List<MovieModel>> moviesFuture = ObservableFuture.value([]);

  @computed
  List<MovieModel> get movies => moviesFuture.value ?? [];

  @action
  Future loadAllMovies() async {
   moviesFuture = ObservableFuture(
    _dioService.get(url: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")
        .then((response) {
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        print('Conteúdo de response.data: ${response.data}');

        // Retorna a lista de filmes
        return data.map((item) => MovieModel.fromMap(item)).toList();
      } else {
        // Se ocorrer um erro, lança uma exceção
        throw Exception('Erro ao buscar filmes: ${response.statusCode}');
      }
    }).catchError((error) {
      // Captura a exceção e trata conforme necessário
      print('Erro ao buscar filmes: $error');
      return List<MovieModel>.empty(); // Retorna uma lista vazia ou outro valor padrão
    }),
  );
  }


  @observable
  ObservableFuture<List<SerieModel>> seriesFuture = ObservableFuture.value([]);

  @computed
  List<SerieModel> get series => seriesFuture.value ?? [];

  @action
  Future<void> loadAllSeries() async {
    seriesFuture = ObservableFuture(
      _dioService
          .get(url: "https://api.themoviedb.org/3/tv/popular?language=en-US&page=1")
          .then((response) {
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data['results'];
          print('Conteúdo de response.data: ${response.data}');

          // Retorna a lista de séries
          return data.map((item) => SerieModel.fromMap(item)).toList();
        } else {
          throw Exception('Erro ao buscar séries: ${response.statusCode}');
        }
      }),
    );
  }
}