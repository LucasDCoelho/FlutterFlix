// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: 'AuthStoreBase.isValid'))
      .value;

  late final _$tokenAtom = Atom(name: 'AuthStoreBase.token', context: context);

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

  late final _$updateTokenAsyncAction =
      AsyncAction('AuthStoreBase.updateToken', context: context);

  @override
  Future<void> updateToken() {
    return _$updateTokenAsyncAction.run(() => super.updateToken());
  }

  late final _$loginAsyncAction =
      AsyncAction('AuthStoreBase.login', context: context);

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  @override
  String toString() {
    return '''
token: ${token},
isValid: ${isValid}
    ''';
  }
}
