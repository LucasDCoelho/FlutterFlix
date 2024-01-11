import 'package:mobx/mobx.dart';

part 'navigation_bar_store.g.dart';

class NavigationBarStore = _NavigationBarStoreBase with _$NavigationBarStore;

abstract class _NavigationBarStoreBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void updateSelectedIndex(int index) {
    selectedIndex = index;
  }
}