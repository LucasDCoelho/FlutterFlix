import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_flix_project_4/src/modules/client/widget/carousel.dart';
import 'package:flutter_flix_project_4/src/modules/client/widget/categories.dart';
import 'package:flutter_flix_project_4/src/modules/auth/stores/auth_store/auth_store.dart';
import 'package:flutter_flix_project_4/src/modules/client/stores/list_movies_store/list_movies_store.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    listMovies.loadAllMovies();
    listMovies.loadAllSeries();
    listMovies.loadUpComing();
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
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) {
                  switch (listMovies.upComingFuture.status) {
                    case FutureStatus.pending:
                      return const CircularProgressIndicator();
                    case FutureStatus.rejected:
                      return Text(
                        'Erro ao carregar filmes: ${listMovies.upComingFuture.error}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    default:
                      return Carousel(
                        imgList: listMovies.upComing.toList(),
                      );
                  }
                },
              ),
              SizedBox(
                height: 6.h,
              ),
              // Observer(
              //     builder: (_) => ElevatedButton(
              //         onPressed: authStore.logout, child: const Text("Sair"))),
              Observer(builder: (_) {
                switch (listMovies.moviesFuture.status) {
                  case FutureStatus.pending:
                    return const CircularProgressIndicator();
                  case FutureStatus.rejected:
                    return Text(
                        'Erro ao carregar filmes: ${listMovies.moviesFuture.error}');
                  default:
                    return MovieCategories(
                      list: listMovies.movies.toList(),
                      titleCategorie: "Mais Populares",
                    );
                }
              }),
              SizedBox(
                height: 5.h,
              ),
              Observer(builder: (_) {
                switch (listMovies.seriesFuture.status) {
                  case FutureStatus.pending:
                    return const CircularProgressIndicator();
                  case FutureStatus.rejected:
                    return Text(
                        'Erro ao carregar as series: ${listMovies.seriesFuture.error}');
                  default:
                    return MovieCategories(
                      list: listMovies.series.toList(),
                      titleCategorie: "Series",
                    );
                }
              }),
              SizedBox(
                height: 9.h,
              ),
            ],
          ),
        ]),);
  }
}
