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
}
