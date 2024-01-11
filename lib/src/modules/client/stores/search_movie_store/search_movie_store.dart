import 'package:flutter_flix_project_4/src/core/service/dio_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'search_movie_store.g.dart';

class SearchMovieStore = _SearchMovieStoreBase with _$SearchMovieStore;

abstract class _SearchMovieStoreBase with Store {
  final _dioService = Modular.get<DioService>();

  @observable
  String searchQuery = '';

  @observable
  ObservableList<dynamic> filteredResults = ObservableList<dynamic>();

  @observable
  ObservableList<dynamic> searchResults = ObservableList<dynamic>();

  @action
  Future<void> searchMovies(String query) async {
    try {
      final response = await _dioService.get(
        url: 'https://api.themoviedb.org/3/search/movie',
        queryParameters: {
          'query': query,
        },
      );

      if (response.statusCode == 200) {
        searchResults = ObservableList<dynamic>.of(response.data['results']);
      } else {
        searchResults = ObservableList<dynamic>();
      }
    } catch (e) {
      searchResults = ObservableList<dynamic>();
    }
  }

  
  @action
  void updateFilteredResults() {
    filteredResults = ObservableList<dynamic>.of(
      searchResults.where(
        (movie) =>
            movie['title'].toLowerCase().contains(searchQuery.toLowerCase()),
      ),
    );
  }

  @action
  void setSearchQuery(String query) {
    searchQuery = query;
    updateFilteredResults();
  }

}
