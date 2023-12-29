import 'package:firebase_auth/firebase_auth.dart';


class FirebaseAuthService {
  final firebase = FirebaseAuth.instance;

  Stream<User?> authStateChanges() {
    return firebase.authStateChanges();
  }

  User? get currentUser => firebase.currentUser;


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

  Future<void> logout() async {
    return await firebase.signOut();
  }


}


