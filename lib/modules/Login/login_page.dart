import 'package:chatflutter/modules/Login/widgets/button_google_widget.dart';
import 'package:chatflutter/shared/widgets/button_widget.dart';
import 'package:chatflutter/shared/widgets/input_password_widget.dart';
import 'package:chatflutter/shared/widgets/input_text_widget.dart';
import 'package:chatflutter/shared/widgets/separator_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  Future logIn(String usuario, String senha) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: usuario,
      password: senha,
    )
        .then(
      (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logado com sucesso!!'),
          ),
        );
      },
    ).catchError(
      (error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Falha ao logar!!'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerLogin = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();
    String email = '';
    String senha = '';
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(email),
              TextField(
                onChanged: (value) => setState(
                  () {
                    email = value;
                  },
                ),
              ),
              // InputTextWidget(
              //   onChanged: (value) => setState(
              //     () {
              //       email = value;
              //     },
              //   ),
              // ),
              const SizedBox(height: 25),
              InputTextWidget(
                onChanged: (value) {
                  setState(() {
                    senha = value;
                  });
                },
              ),
              const SizedBox(height: 25),
              Button(
                onClick: () => logIn(
                  email.trim(),
                  senha,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: SeparatorWidget(),
              ),
              const ButtonGoogle(),
            ],
          ),
        ),
      ),
    );
  }
}
