import 'package:flutter/material.dart';
import 'package:flutter_flix_project_4/src/modules/client/models/content_details_model.dart';
import 'package:flutter_flix_project_4/src/modules/client/stores/favorite_list_store/favorite_list_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsScreen extends StatelessWidget {
  final ContentDetailsModel? contentDetails;

  const DetailsScreen({super.key, this.contentDetails});

  @override
  Widget build(BuildContext context) {
    final favoriteListStore = FavoriteListStore();
    ContentDetailsModel? contentDetails =
        ModalRoute.of(context)!.settings.arguments as ContentDetailsModel;

    final int itemId = contentDetails.id;
    final String tag = contentDetails.posterPath;

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Hero(
        tag: tag,
        child: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: 60.h, // Altura expandida da AppBar
            floating: false, // Define como não flutuante para sempre visível
            pinned: true, // Mantém a AppBar visível mesmo ao rolar para cima
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://image.tmdb.org/t/p/w500${contentDetails.posterPath}', // Substitua pelo URL do seu cartaz de filme
                fit: BoxFit.cover,
              ),
            ),
            leading: Container(
              margin: EdgeInsets.only(left: 2.w),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black // Ajuste a opacidade conforme necessário
                  ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.w),
                      child: Text(
                        contentDetails.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.w),
                      child: Row(children: [
                        _buildStarRating(contentDetails.voteAverage),
                        SizedBox(width: 2.w),
                        Text(
                          "(${contentDetails.voteCount.toStringAsFixed(0)})", // Limitando para uma casa decimal
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2.w),
                      child: Text(
                        contentDetails.overview,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Column(
                      children: [
                        Observer(builder: (_) {
                          return TextButton(
                            onPressed: () {
                              if (favoriteListStore.favorites
                                  .contains(itemId)) {
                                // Se já estiver nos favoritos, remova
                                favoriteListStore.removeFromFavorites(itemId);
                              } else {
                                // Se não estiver nos favoritos, adicione
                                favoriteListStore.addToFavorites(itemId);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  favoriteListStore.favorites.contains(itemId)
                                      ? Icons.close
                                      : Icons.check,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                  favoriteListStore.favorites.contains(itemId)
                                      ? "Remover dos Favoritos"
                                      : "Adicionar aos Favoritos",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        })
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget _buildStarRating(double starRating) {
  // Função para construir ícones de estrelas com base no starRating
  const int totalStars = 10;
  List<Widget> stars = [];

  for (int i = 0; i < totalStars; i++) {
    IconData iconData = i < starRating.round() ? Icons.star : Icons.star_border;
    Color color = Colors.amber;

    stars.add(
      Icon(
        iconData,
        color: color,
        size: 18,
      ),
    );
  }

  return Row(
    children: stars,
  );
}
