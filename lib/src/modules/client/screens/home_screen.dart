import 'package:flutter/material.dart';
import 'package:flutter_flix_project_4/src/modules/auth/stores/auth_store/auth_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = Modular.get<AuthStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Welcome"),
          Observer(
              builder: (_) => ElevatedButton(
                  onPressed: authStore.logout, child: const Text("Sair")))
        ],
      )),
    );
  }
}
