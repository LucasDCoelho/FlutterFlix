import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_flix_project_4/src/modules/auth/stores/auth_store/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard{
  AuthGuard() : super(redirectTo: '/login/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final authStore = Modular.get<AuthStore>();

    authStore.authService.authStateChanges().listen((User? user) {
      // Atualiza o estado de autenticação no AuthStore
      authStore.isAuthenticated = user != null;
    });

    // Redirecione para a página de login se não estiver autenticado
    return authStore.isAuthenticated;
  }
}