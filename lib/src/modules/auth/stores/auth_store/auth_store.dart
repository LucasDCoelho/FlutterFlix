import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_flix_project_4/src/modules/auth/models/client_model.dart';
import 'package:flutter_flix_project_4/src/modules/auth/services/firebase_auth_service.dart';
import 'package:flutter_flix_project_4/src/modules/auth/stores/token_store/token_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import "package:mobx/mobx.dart";

part "auth_store.g.dart";

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  var client = Client();
  final authService = FirebaseAuthService();
  final TokenStorage tokenStorage;


  @computed
  bool get isValid {
    return validateEmail() == null && validatePassword() == null;
  }

  @observable
  bool isAuthenticated = false;

  @action
  setIsAuthenticated(bool value) => isAuthenticated = value;

  AuthStoreBase(this.tokenStorage) {
    // Adicione um ouvinte para as mudanças no estado de autenticação

    if (isAuthenticated) {
    // Adicione a lógica para inicializar o estado de autenticação aqui
    User? user = authService.currentUser;
    isAuthenticated = user != null;

    if (isAuthenticated) {
      updateToken();
    }
  }
}


  @observable
  String? token;

  @action
  Future<void> updateToken() async {
    // Verifica se há um usuário autenticado
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        // Obtem o token do usuário autenticado
        token = await FirebaseAuth.instance.currentUser?.getIdToken();


        // Salva o token usando o TokenStorage
        await tokenStorage.saveToken(token);

        // Indica que a atualização do token foi bem-sucedida
        return;
      } catch (error) {
        // Trata erros ao obter o token
      }
    }
    // Se não houver usuário autenticado, limpa o token
    token = null;
  }

  String? validateEmail() {
    if (client.email == "" || client.email.isEmpty) {
      return "Este campo é obrigatorio";
    }

    if (client.email.length < 3) {
      return "Seu email precisa ter mais de 3 caracteres";
    }
    return null;
  }

  String? validatePassword() {
    if (client.password == "" || client.password.isEmpty) {
      return "Este campo é obrigatorio";
    }

    if (client.password.length < 3) {
      return "Seu nome precisa ter mais de 3 caracteres";
    }
    return null;
  }

  @action
  Future<bool> login() async {
    try {
      if (isValid) {
        await authService.login(client.email, client.password);

        return true;
      }
      return false;
    } catch (error) {
      // Tratar erros de autenticação aqui
      print("Erro durante o login: $error");
      return false;
    }
  }

  Future logout() async {
    await authService.logout();

    await clearTokenStorage();

    Modular.to.pushReplacementNamed("/login/");
  }

  Future<void> clearTokenStorage() async {
    await tokenStorage.clearToken();
    token = null;
  }
}
