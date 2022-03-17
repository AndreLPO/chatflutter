import 'package:chatflutter/modules/Login/login_controller.dart';
import 'package:chatflutter/modules/Login/login_model.dart';
import 'package:chatflutter/modules/Login/validators.dart';
import 'package:chatflutter/shared/widgets/button_widget.dart';
import 'package:chatflutter/shared/widgets/input_password_widget.dart';
import 'package:chatflutter/shared/widgets/input_text_widget.dart';
import 'package:chatflutter/shared/widgets/separator_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

LoginModel user = LoginModel();
LoginController controller = LoginController();
Validators validator = Validators();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputTextWidget(
                  label: "E-mail",
                  onChanged: (value) => user.email = value,
                  validator: (value) => validator.validaLogin(value),
                ),
                const SizedBox(height: 25),
                InputPasswordWidget(
                  onChanged: (value) => user.senha = value,
                ),
                const SizedBox(height: 25),
                Button(
                    texto: "Login",
                    onClick: () async {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ));

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
                        } finally {
                          Modular.to.pop();
                        }
                      }
                    }),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: SeparatorWidget(),
                ),
                Button(
                    onClick: () {
                      Modular.to.pushNamed('/cadastro');
                    },
                    texto: "Cadastre-se")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
