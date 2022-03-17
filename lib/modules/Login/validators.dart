import 'package:chatflutter/modules/Cadastro/cadastro_model.dart';

class Validators {
  validaLogin(String? value) {
    if (value == '') {
      return "Campo não pode ser vazio";
    }
    if (!value!.contains('@') || !value.contains('.com')) {
      return 'E-mail inválido';
    }
    return null;
  }

  validaSenha(String? value) {
    if (value == '') {
      return "Campo não pode ser vazio";
    }
    return null;
  }

  validaNovaSenha(String? value, {CadastroModel? cadastroModel}) {
    if (value == '') {
      return "Campo não pode ser vazio";
    }

    if (value!.length < 8) {
      return "Senha deve ter no mínimo 8 caracteres";
    }

    if (value.toLowerCase() == value) {
      return "Senha deve ter no mínimo 1 letra maiúscula";
    }

    if (value.toUpperCase() == value) {
      return "Senha deve ter no mínimo 1 letra minúscula";
    }

    if (cadastroModel!.senha != cadastroModel.repetirSenha) {
      return "As senhas devem ser iguais";
    }
  }
}
