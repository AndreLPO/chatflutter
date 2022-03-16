import 'package:chatflutter/app_widget.dart';
import 'package:chatflutter/modules/Home/home_page.dart';
import 'package:chatflutter/modules/Login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // Firebase.initializeApp();
    // FirebaseFirestore.instance.collection('users').add({"texto": "andre"});
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Material(
              child: Center(
                child: Text("Erro ao iniciar o Firebase!",
                    textDirection: TextDirection.ltr),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const AppWidget();
          }
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) {
          return StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return const HomePage();
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const LoginPage();
                }
              });
        }),
      ];
}
