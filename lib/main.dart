import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flix_project_4/src/app_module.dart';
import 'package:flutter_flix_project_4/src/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

    // Por default ele irá para o .env
    await dotenv.load();
  runApp(ModularApp(module: AppModule(), child: const AppWidget(),));
}
