import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  const MovieCard({
    required this.posterPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 150,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w185$posterPath",
              )),
        ));
  }
}
