import 'package:flutter_flix_project_4/src/core/screens/splash_screen.dart';
import 'package:flutter_flix_project_4/src/core/service/dio_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module{

  @override
  void exportedBinds(Injector i) {
    i.add(DioService.new);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (context) => const SplashScreen());
  }
}