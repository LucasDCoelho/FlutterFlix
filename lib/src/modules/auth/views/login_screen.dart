import 'package:flutter/material.dart';
import 'package:flutter_flix_project_4/src/modules/auth/stores/auth_store/auth_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_flix_project_4/src/modules/auth/widgets/auth_form.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = Modular.get<AuthStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Observer(
                builder: (_) => AuthForm<AuthStore>(
                      onChanged: authStore.client.setEmail,
                      obscureText: false,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Email",
                          hintText: "Digite seu email",
                          errorText: authStore.validateEmail()),
                    )),
            const SizedBox(
              height: 20,
            ),
            Observer(
                builder: (_) => AuthForm<AuthStore>(
                      onChanged: authStore.client.setPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Senha",
                          hintText: "Digite sua senha",
                          errorText: authStore.validatePassword(),
                          suffixIcon: const Icon(
                            Icons.visibility
                          ),
                          ),
                      
                    )),
            const SizedBox(
              height: 50,
            ),
            Observer(
                builder: (_) => ElevatedButton(
                      onPressed: authStore.isValid
                          ? () async {
                              bool logginSuccessful = await authStore.login();
                              if(logginSuccessful){
                                if (authStore.authService.currentUser != null) {
                                  Modular.to.pushReplacementNamed("/home/");
                                }
                              }
                            }
                          : null,
                      child: const Text("Entrar"),
                    )),
            Observer(
              builder: (_) => ElevatedButton(
                  onPressed: authStore.logout, child: const Text("Sair")),
            )
          ],
        ),
      ),
    );
  }
}
