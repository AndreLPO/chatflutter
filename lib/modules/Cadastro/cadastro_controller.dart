import 'package:chatflutter/modules/Cadastro/cadastro_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroController {
  Future signUp(CadastroModel dadosCadastro) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: dadosCadastro.email.trim(),
      password: dadosCadastro.senha,
    );
  }
}
