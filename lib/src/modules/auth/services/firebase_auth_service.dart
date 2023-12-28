import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'firebase_auth_service.g.dart';

class FirebaseAuthService = FirebaseAuthServiceBase with _$FirebaseAuthService;

abstract class FirebaseAuthServiceBase with Store{
  final firebase = FirebaseAuth.instance;

  void login(String email, String password) async{
    try{
      await firebase.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
    } on FirebaseAuthException catch (firebaseError){
      if (firebaseError.code == 'user_not_found'){
        print("Email não cadastrado");
      } else if (firebaseError.code == 'wrong_password'){
        print("Senha incorreta");
      }
    }
  }

  void logout(){
    firebase.signOut();
  }
}


