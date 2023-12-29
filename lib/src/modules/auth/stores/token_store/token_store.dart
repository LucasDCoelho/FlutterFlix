import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'token_store.g.dart';

class TokenStorage = _TokenStorageBase with _$TokenStorage;

abstract class _TokenStorageBase with Store {
  static const _tokenKey = 'auth_token';

  @observable
  String? token;

  @action
  Future<void> saveToken(String? token) async{
    if(token != null){
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);
      this.token = token;
    }
  }

  @action
  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString(_tokenKey);
  }

  @action
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    token = null;
  }
  
}