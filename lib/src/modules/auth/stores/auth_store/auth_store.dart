import 'package:flutter_flix_project_4/src/modules/auth/models/client_model.dart';
import 'package:flutter_flix_project_4/src/modules/auth/services/firebase_auth_service.dart';
import "package:mobx/mobx.dart";

part "auth_store.g.dart";

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store{
  var client = Client();
  final authService = FirebaseAuthService();

  @computed
  bool get isValid {
    return validateEmail() == null && validatePassword() == null;
  }

  @computed
  bool get isAuthenticated {
    if(isValid){
      return true;
    }
    return false;
  }

  String? validateName(){
    if(client.name == "" || client.name.isEmpty){
      return "Este campo é obrigatorio";
    }

    if(client.name.length < 3){
      return "Seu nome precisa ter mais de 3 caracteres";
    }
    return null;  
  }

  String? validateEmail(){
    if(client.email == "" || client.email.isEmpty){
      return "Este campo é obrigatorio";
    }

    if(client.email.length < 3){
      return "Seu email precisa ter mais de 3 caracteres";
    }
    return null;  
  }

  String? validatePassword(){
    if(client.password == "" || client.password.isEmpty){
      return "Este campo é obrigatorio";
    }

    if(client.password.length < 3){
      return "Seu nome precisa ter mais de 3 caracteres";
    }
    return null;  
  }

  @action
  Future<bool> login() async {
    if(isAuthenticated){
      authService.login(client.email, client.password);
      return isAuthenticated;
    }
    return isAuthenticated;
  }
}