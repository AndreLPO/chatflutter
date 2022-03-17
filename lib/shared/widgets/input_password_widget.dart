import 'package:chatflutter/modules/Login/validators.dart';
import 'package:flutter/material.dart';

Validators validator = Validators();

class InputPasswordWidget extends StatefulWidget {
  final Function(String value)? onChanged;
  const InputPasswordWidget({Key? key, this.onChanged}) : super(key: key);

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  final obscureText = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obscureText,
      builder: (_, bool isVisible, __) => TextFormField(
        onChanged: widget.onChanged,
        validator: (value) => validator.validaSenha(value),
        obscureText: isVisible,
        decoration: InputDecoration(
          label: const Text("Senha"),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () => obscureText.value = !obscureText.value,
                icon: const Icon(Icons.remove_red_eye_outlined)),
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
