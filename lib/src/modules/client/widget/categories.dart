import 'package:flutter/material.dart';
import 'package:flutter_flix_project_4/src/modules/client/widget/custom_card.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MovieCategories extends StatefulWidget {
  final List<dynamic> list;
  final String titleCategorie;

  const MovieCategories({
    required this.list,
    required this.titleCategorie,
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
        Text(
          widget.titleCategorie,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
                    Modular.to.pushReplacementNamed("/home/details",
                        arguments: card.posterPath);
                  },
                );
              }),
        ),
      ],
    );
  }
}
