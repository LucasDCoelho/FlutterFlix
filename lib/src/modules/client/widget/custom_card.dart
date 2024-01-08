import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String posterPath;
  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;
  final void Function()? onTap;

  const CustomCard({
    required this.posterPath,
    required this.height,
    required this.width,
    this.margin,
    this.borderRadius,
    this.fit,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.blue.withAlpha(30),
          onTap: onTap,
        child: Hero(
          tag: posterPath,
          child: Container(
            height: height,
            width: width,
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              image: DecorationImage(
                  fit: fit,
                  image: NetworkImage(
                    "https://image.tmdb.org/t/p/w185$posterPath",
                  )),
            ),),
      ));
  }
}
