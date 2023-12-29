import 'package:flutter_flix_project_4/src/core/core_module.dart';
import 'package:flutter_flix_project_4/src/modules/auth/auth_guards.dart';
import 'package:flutter_flix_project_4/src/modules/auth/auth_module.dart';
import 'package:flutter_flix_project_4/src/modules/client/client_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule(),
    AuthModule(),
    ClientModule()
  ];


  @override
  void routes(RouteManager r) {
    r.module("/", module: CoreModule(), transition: TransitionType.fadeIn);
    r.module("/login", module: AuthModule(), transition: TransitionType.fadeIn);
    r.module("/home", module: ClientModule(), guards: [AuthGuard()], transition: TransitionType.fadeIn);
  }

} 