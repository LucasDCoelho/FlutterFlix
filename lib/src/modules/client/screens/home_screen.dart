import 'package:flutter/material.dart';
import 'package:flutter_flix_project_4/src/modules/auth/stores/auth_store/auth_store.dart';
import 'package:flutter_flix_project_4/src/modules/client/stores/list_movies_store/list_movies_store.dart';
import 'package:flutter_flix_project_4/src/modules/client/widget/movie_card.dart';
import 'package:flutter_flix_project_4/src/modules/client/widget/movie_categories.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authStore = Modular.get<AuthStore>();
  final listMovies = ListMovies();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future _fetchMovies() async {
    await listMovies.loadAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text("FlutterFlix",
            style: TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold,
              fontSize: 24)),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
              builder: (_) => ElevatedButton(
                  onPressed: authStore.logout, child: const Text("Sair"))),

          MovieCategories(
            future: _fetchMovies(), 
            itemCount: listMovies.movies.length, 
            itemBuilder: (context, index) {
                        final movie = listMovies.movies[index];
                        return MovieCard(
                          posterPath: movie.posterPath,
                        );
                      },
            titleCategorie: "Mais Populares",
          ),
        ],
      ),
    );
  }
}
