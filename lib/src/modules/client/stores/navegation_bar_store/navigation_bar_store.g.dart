// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_bar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationBarStore on _NavigationBarStoreBase, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_NavigationBarStoreBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$_NavigationBarStoreBaseActionController =
      ActionController(name: '_NavigationBarStoreBase', context: context);

  @override
  void updateSelectedIndex(int index) {
    final _$actionInfo = _$_NavigationBarStoreBaseActionController.startAction(
        name: '_NavigationBarStoreBase.updateSelectedIndex');
    try {
      return super.updateSelectedIndex(index);
    } finally {
      _$_NavigationBarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
