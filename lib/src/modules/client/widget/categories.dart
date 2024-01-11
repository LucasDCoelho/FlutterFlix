import 'package:flutter/material.dart';
import 'package:flutter_flix_project_4/src/modules/client/models/content_details_model.dart';
import 'package:flutter_flix_project_4/src/modules/client/widget/custom_card.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MovieCategories extends StatefulWidget {
  final List<dynamic> list;
  final String? titleCategorie;

  const MovieCategories({
    required this.list,
    this.titleCategorie,
    super.key,
  });

  @override
  State<MovieCategories> createState() => _MovieCategoriesState();
}

class _MovieCategoriesState extends State<MovieCategories> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> categorieList = widget.list;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleCategorie != null)
          Text(
            widget.titleCategorie!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorieList.length,
              itemBuilder: (context, index) {
                final card = categorieList[index];
                return CustomCard(
                  height: 200,
                  width: 150,
                  margin: const EdgeInsets.only(right: 5),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  fit: BoxFit.cover,
                  posterPath: card.posterPath,
                  onTap: () {
                    print("Cheguei");
                    Modular.to.pushNamed(
                      "/home/details",
                      arguments: ContentDetailsModel(
                        id: card.id,
                        title: card.title,
                        overview: card.overview,
                        posterPath: card.posterPath,
                        popularity: card.popularity,
                        voteAverage: card.voteAverage,
                        voteCount: card.voteCount,
                        // Adicione outros campos específicos de acordo com o tipo
                      ),
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
