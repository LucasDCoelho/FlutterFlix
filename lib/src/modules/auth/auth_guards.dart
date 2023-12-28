import 'package:flutter_flix_project_4/src/modules/auth/stores/auth_store/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard{
  AuthGuard() : super(redirectTo: '/login/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final authStore = Modular.get<AuthStore>();
    
    await Future.delayed(const Duration(seconds: 1));
    // Se o usuário não estiver autenticado, redirecione para '/login/'
    if (!authStore.isAuthenticated) {
      return false;
    }

    // Se o caminho atual for '/login/', permita a navegação
    if (path == '/login/') {
      return true;
    }

    return true;
  }
}