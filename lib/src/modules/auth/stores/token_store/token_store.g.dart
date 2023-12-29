// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TokenStorage on _TokenStorageBase, Store {
  late final _$tokenAtom =
      Atom(name: '_TokenStorageBase.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$saveTokenAsyncAction =
      AsyncAction('_TokenStorageBase.saveToken', context: context);

  @override
  Future<void> saveToken(String? token) {
    return _$saveTokenAsyncAction.run(() => super.saveToken(token));
  }

  late final _$loadTokenAsyncAction =
      AsyncAction('_TokenStorageBase.loadToken', context: context);

  @override
  Future<void> loadToken() {
    return _$loadTokenAsyncAction.run(() => super.loadToken());
  }

  late final _$clearTokenAsyncAction =
      AsyncAction('_TokenStorageBase.clearToken', context: context);

  @override
  Future<void> clearToken() {
    return _$clearTokenAsyncAction.run(() => super.clearToken());
  }

  @override
  String toString() {
    return '''
token: ${token}
    ''';
  }
}
