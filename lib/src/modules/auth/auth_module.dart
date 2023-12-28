import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_flix_project_4/src/modules/auth/auth_guards.dart';

import 'package:flutter_flix_project_4/src/modules/auth/services/firebase_auth_service.dart';
import 'package:flutter_flix_project_4/src/modules/auth/stores/auth_store/auth_store.dart';
import 'package:flutter_flix_project_4/src/modules/auth/views/login_screen.dart';
import 'package:flutter_flix_project_4/src/modules/client/client_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {

 @override
  void exportedBinds(Injector i) {
    i.add(FirebaseAuthService.new);
    i.addInstance(FirebaseAuth.instance);
    i.add(AuthStore.new);
    i.add(AuthGuard.new);
  }


  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => const LoginScreen());
  }

}