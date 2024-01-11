// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteListStore on _FavoriteListStoreBase, Store {
  late final _$favoritesAtom =
      Atom(name: '_FavoriteListStoreBase.favorites', context: context);

  @override
  ObservableList<int> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<int> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$_FavoriteListStoreBaseActionController =
      ActionController(name: '_FavoriteListStoreBase', context: context);

  @override
  void addToFavorites(int itemId) {
    final _$actionInfo = _$_FavoriteListStoreBaseActionController.startAction(
        name: '_FavoriteListStoreBase.addToFavorites');
    try {
      return super.addToFavorites(itemId);
    } finally {
      _$_FavoriteListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromFavorites(int itemId) {
    final _$actionInfo = _$_FavoriteListStoreBaseActionController.startAction(
        name: '_FavoriteListStoreBase.removeFromFavorites');
    try {
      return super.removeFromFavorites(itemId);
    } finally {
      _$_FavoriteListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
