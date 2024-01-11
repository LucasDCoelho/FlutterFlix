import 'package:flutter/material.dart';
import 'package:flutter_flix_project_4/src/modules/client/stores/favorite_list_store/favorite_list_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteListStore = FavoriteListStore();
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text("Favoritos",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        backgroundColor: Colors.black87,
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
              itemCount: favoriteListStore.favorites.length,
              itemBuilder: (context, index) {
                final itemId = favoriteListStore.favorites[index];
                // Aqui você pode construir widgets com base nos itens favoritos
                return ListTile(
                    title: Text(
                      "Item ID: $itemId",
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // Remover o item da lista de favoritos
                        favoriteListStore.removeFromFavorites(itemId);
                      },
                    ));
              });
        },
      ),
    );
  }
}
