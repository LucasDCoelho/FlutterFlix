import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MovieCategories extends StatelessWidget {
  final Future<dynamic> future;
  final int? itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final String titleCategorie;

  const MovieCategories({
    required this.future,
    required this.itemCount,
    required this.itemBuilder,
    required this.titleCategorie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Mais Populares",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Quando a chamada assíncrona estiver concluída
                return Observer(builder: (_) {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: itemCount,
                      itemBuilder: itemBuilder
                    ),
                  );
                });
              } else {
                // Enquanto a chamada assíncrona ainda está em andamento
                return const CircularProgressIndicator();
              }
            })
      ],
    );
  }
}
