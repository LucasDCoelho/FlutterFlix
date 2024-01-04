import 'package:flutter_flix_project_4/src/modules/auth/stores/auth_store/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard{
  AuthGuard() : super(redirectTo: '/login/');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final authStore = Modular.get<AuthStore>();
    final token = authStore.tokenStorage.loadToken();

    if(await token){
      return true;
    }
    return false;
    
  }
}