import 'package:chatflutter/modules/Login/login_controller.dart';
import 'package:chatflutter/modules/Login/login_model.dart';
import 'package:chatflutter/modules/Login/widgets/button_google_widget.dart';
import 'package:chatflutter/shared/widgets/button_widget.dart';
import 'package:chatflutter/shared/widgets/input_password_widget.dart';
import 'package:chatflutter/shared/widgets/input_text_widget.dart';
import 'package:chatflutter/shared/widgets/separator_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

LoginModel user = LoginModel();
LoginController controller = LoginController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputTextWidget(onChanged: (value) => user.email = value),
                const SizedBox(height: 25),
                InputPasswordWidget(onChanged: (value) => user.senha = value),
                const SizedBox(height: 25),
                Button(onClick: () async {
                  try {
                    await controller.logIn(user);
                  } on FirebaseAuthException {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Usuário ou senha incorretos',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: SeparatorWidget(),
                ),
                const ButtonGoogle(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
