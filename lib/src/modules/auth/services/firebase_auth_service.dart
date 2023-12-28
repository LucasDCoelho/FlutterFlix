import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthService {
  final firebase = FirebaseAuth.instance;

  authStatesChanges(){
    firebase.authStateChanges();
  }

  Future<bool> login(String email, String password) async{
    try{
      await firebase.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return true;
    } on FirebaseAuthException catch (firebaseError){
      if (firebaseError.code == 'user_not_found'){
        print("Email não cadastrado");
      } else if (firebaseError.code == 'wrong_password'){
        print("Senha incorreta");
      }

      return false;
    }
  }

  void logout(){
    firebase.signOut();
  }


}


