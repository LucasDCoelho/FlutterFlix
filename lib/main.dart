import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flix_project_4/src/app_module.dart';
import 'package:flutter_flix_project_4/src/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'src/core/FirebaseCore/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitializeFirebaseApp().initializeFirebaseOptions();
  runApp(ModularApp(module: AppModule(), child: const AppWidget(),));
}

class InitializeFirebaseApp {
  void initializeFirebaseOptions() async {
     await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
 
}
