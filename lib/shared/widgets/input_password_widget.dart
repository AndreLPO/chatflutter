import 'package:flutter/material.dart';

class InputPasswordWidget extends StatefulWidget {
  const InputPasswordWidget({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: const Text("Senha"),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_red_eye_outlined)),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
