import 'package:flutter_flix_project_4/src/core/screens/splash_screen.dart';
import 'package:flutter_flix_project_4/src/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  List<Module> get imports => [
    AuthModule()
  ];
    

  @override
  void routes(RouteManager r) {
      r.child("/", child: (_) => const SplashScreen());
  }

} 