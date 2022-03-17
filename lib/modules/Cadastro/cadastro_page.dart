import 'package:chatflutter/modules/Cadastro/cadastro_controller.dart';
import 'package:chatflutter/modules/Cadastro/cadastro_model.dart';
import 'package:chatflutter/modules/Login/validators.dart';
import 'package:chatflutter/shared/widgets/button_widget.dart';
import 'package:chatflutter/shared/widgets/input_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

CadastroController controller = CadastroController();
CadastroModel user = CadastroModel();
Validators validator = Validators();
final formKeyCadastro = GlobalKey<FormState>();

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKeyCadastro,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InputTextWidget(
                  label: 'E-mail',
                  onChanged: (value) => user.email = value,
                  validator: (value) => validator.validaLogin(value),
                ),
                const SizedBox(height: 25),
                InputTextWidget(
                  label: 'Senha',
                  onChanged: (value) => user.senha = value,
                  validator: (value) =>
                      validator.validaNovaSenha(value, cadastroModel: user),
                ),
                const SizedBox(height: 25),
                InputTextWidget(
                  label: 'Confirme sua senha',
                  onChanged: (value) => user.repetirSenha = value,
                  validator: (value) =>
                      validator.validaNovaSenha(value, cadastroModel: user),
                ),
                const SizedBox(height: 25),
                Button(
                    onClick: () async {
                      if (formKeyCadastro.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ));

                        try {
                          await controller.signUp(user);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Usuário ${user.email} criado com sucesso!',
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Modular.to.pushNamed('/');
                        } on FirebaseAuthException catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Erro ao criar novo usuário: ${error.message}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } finally {
                          Modular.to.pop();
                        }
                      }
                    },
                    texto: "Salvar")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
