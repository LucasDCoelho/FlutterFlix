import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class DetailsScreen extends StatelessWidget {
  final String? posterPath;

  const DetailsScreen({super.key, this.posterPath});

 

  @override
  Widget build(BuildContext context) {
    
    final String? posterPath = ModalRoute.of(context)?.settings.arguments as String?;

    final String tag = posterPath ?? '';

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Use Navigator.pop com uma animação de desvanecimento
              Navigator.of(context).pushReplacementNamed("/home/");
            },
          ),
        ],
        title: const Text('Detalhes do Filme'),
      ),
      body: Center(
        child: Hero(
          tag: tag, // Use a mesma tag única da Hero na tela anterior
          child: Container(
            height: 400, // Ajuste a altura conforme necessário
            width: 300, // Ajuste a largura conforme necessário
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w185$posterPath",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}