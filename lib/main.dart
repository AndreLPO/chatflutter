import 'package:chatflutter/app_widget.dart';
import 'package:chatflutter/modules/Cadastro/cadastro_module.dart';
import 'package:chatflutter/modules/Chat/chat_page.dart';
import 'package:chatflutter/modules/ChatInfo/chat_info_page.dart';
import 'package:chatflutter/modules/Home/home_page.dart';
import 'package:chatflutter/modules/Login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
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
                } else {
                  return const LoginPage();
                }
              });
        }),
        ChildRoute('/chat', child: (context, args) => const ChatPage()),
        ChildRoute('/chat_info', child: (context, args) => const ChatInfo()),
        ModuleRoute('/cadastro', module: CadastroModule())
      ];
}
