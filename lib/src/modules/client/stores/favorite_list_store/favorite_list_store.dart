import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favorite_list_store.g.dart';

class FavoriteListStore = _FavoriteListStoreBase with _$FavoriteListStore;

abstract class _FavoriteListStoreBase with Store {
  late SharedPreferences _preferences;

  @observable
  ObservableList<int> favorites = ObservableList<int>();

  @action
  void addToFavorites(int itemId) {
    if (!favorites.contains(itemId)) {
      favorites.add(itemId);
      _saveFavorites();
    }
  }

  _FavoriteListStoreBase() {
    _loadFavorites();
  }

  @action
  void removeFromFavorites(int itemId) {
    favorites.remove(itemId);
    _saveFavorites();
  }

  Future<void> _loadFavorites() async {
    _preferences = await SharedPreferences.getInstance();
    final savedFavorites = _preferences.getStringList('favorites')?.map((id) => int.parse(id)) ?? [];
    favorites.addAll(savedFavorites);
  }

  void _saveFavorites() {
    _preferences.setStringList('favorites', favorites.map((id) => id.toString()).toList());
  }
}
