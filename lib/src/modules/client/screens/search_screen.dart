import 'package:flutter/material.dart';
import 'package:flutter_flix_project_4/src/modules/client/stores/search_movie_store/search_movie_store.dart';
import 'package:flutter_flix_project_4/src/modules/client/widget/custom_card.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final SearchMovieStore searchStore = SearchMovieStore();

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Buscar",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(builder: (_) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                child: TextField(
                  onChanged: (query) {
                    searchStore.setSearchQuery(query);
                    searchStore.searchMovies(query);
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                      hintText: 'Buscar...',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      )),
                ),
              );
            }),
          ),
          Expanded(
            child: Observer(
              builder: (context) {
                if (searchStore.filteredResults.isEmpty) {
                  return const Center(
                    child: Text('Sem resultados...',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  );
                }

                return ListView.builder(
                  itemCount: searchStore.filteredResults.length,
                  itemBuilder: (context, index) {
                    final movie = searchStore.filteredResults[index];
                    return ListTile(
                      title: Row(
                        children: [
                          CustomCard(
                              posterPath: movie["poster_path"],
                              height: 15.h,
                              width: 20.w
                          ),
                          SizedBox(
                            width: 1
                                .w, // Adicione um espaçamento adequado entre o cartão e o texto
                          ),
                          Flexible(
                            child: Text(
                              movie['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      // Adicione outros detalhes do filme conforme necessário
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
