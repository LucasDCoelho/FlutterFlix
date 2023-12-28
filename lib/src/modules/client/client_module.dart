import 'package:flutter_flix_project_4/src/modules/auth/auth_guards.dart';
import 'package:flutter_flix_project_4/src/modules/auth/auth_module.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientModule extends Module {

  @override
  List<Module> get imports => [
    AuthModule()
  ];


  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const HomeScreen(), guards: [AuthGuard()]);
  }
}