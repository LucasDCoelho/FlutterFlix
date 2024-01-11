import 'package:flutter_flix_project_4/src/core/core_module.dart';
import 'package:flutter_flix_project_4/src/modules/auth/auth_module.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/details_screen.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/favorite_screen.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/home_screen.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/search_screen.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/settings_screen.dart';
import 'package:flutter_flix_project_4/src/modules/client/widget/gnav_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientModule extends Module {
  @override
  List<Module> get imports => [
    AuthModule(),
    CoreModule()
  ];

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const CustomGNav(), children: [
      ChildRoute("/home", child: (_) => const HomeScreen()),
      ChildRoute("/favorites", child: (_) => const FavoriteScreen()),
      ChildRoute("/search", child: (_) => const SearchScreen()),
      ChildRoute("/settings", child: (_) => const SettingsScreen()),
    ]);
    r.child("/details", child: (_) => const DetailsScreen());
  }
}