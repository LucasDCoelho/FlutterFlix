import 'package:flutter/material.dart';
import 'package:flutter_flix_project_4/src/modules/client/stores/navegation_bar_store/navigation_bar_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/favorite_screen.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/home_screen.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/search_screen.dart';
import 'package:flutter_flix_project_4/src/modules/client/screens/settings_screen.dart';

class CustomGNav extends StatelessWidget {
  const CustomGNav({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
      HomeScreen(),
      FavoriteScreen(),
      SearchScreen(),
      SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationStore = NavigationBarStore();

    final List<NavItem> navItems = [
      NavItem(icon: Icons.home, text: "Home"),
      NavItem(icon: Icons.bookmark, text: "Lista"),
      NavItem(icon: Icons.search, text: "Buscar"),
      NavItem(icon: Icons.settings, text: "Configurações"),
    ];

    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: _widgetOptions.elementAt(navigationStore.selectedIndex),
        ),
        bottomNavigationBar: GNav(
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey,
          padding: const EdgeInsets.all(16),
          gap: 5,
          selectedIndex: navigationStore.selectedIndex,
          onTabChange: (index) {
            navigationStore.updateSelectedIndex(index);
          },
          tabs: navItems.map((item) {
            return GButton(
              icon: item.icon,
              text: item.text,
            );
          }).toList(),
        ),
      );
    });
  }
}

class NavItem {
  final IconData icon;
  final String text;

  NavItem({required this.icon, required this.text});
}
