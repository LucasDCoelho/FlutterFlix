import 'package:flutter_flix_project_4/src/core/service/dio_service.dart';
import 'package:flutter_flix_project_4/src/modules/client/models/movie_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'list_movies_store.g.dart';

class ListMovies = ListMoviesBase with _$ListMovies;

abstract class ListMoviesBase with Store{
  final _dioService = Modular.get<DioService>();

  @observable
  List<MovieModel> movies = [];

  @action
  Future loadAllMovies() async {
    try {
      final response = await _dioService.get(url: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1");

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        print('Conteúdo de response.data: ${response.data}');

        // Limpar a lista antes de adicionar novos dados
        movies.clear();

        // Adicionar os novos dados à lista
        movies.addAll(data.map((item) => MovieModel.fromMap(item)).toList());
        print("${movies.length}");
      } else {
        // Trate os erros da API conforme necessário
        print('Erro ao buscar filmes: ${response.statusCode}');
      }
    } catch (e) {
      // Trate outros erros conforme necessário
      print('Erro ao buscar filmes: $e');
    }
  }
}