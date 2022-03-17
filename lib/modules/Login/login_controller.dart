import 'package:chatflutter/modules/Login/login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  Future logIn(LoginModel loginData) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginData.email.trim(),
      password: loginData.senha,
    );
  }
}
