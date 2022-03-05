import 'package:chatflutter/modules/Login/widgets/button_google_widget.dart';
import 'package:chatflutter/shared/widgets/button_widget.dart';
import 'package:chatflutter/shared/widgets/input_password_widget.dart';
import 'package:chatflutter/shared/widgets/input_text_widget.dart';
import 'package:chatflutter/shared/widgets/separator_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              InputTextWidget(),
              SizedBox(height: 25),
              InputPasswordWidget(),
              SizedBox(height: 25),
              Button(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: SeparatorWidget(),
              ),
              ButtonGoogle()
            ],
          ),
        ),
      ),
    );
  }
}
