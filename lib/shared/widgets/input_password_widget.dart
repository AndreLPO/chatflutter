import 'package:flutter/material.dart';

class InputPasswordWidget extends StatefulWidget {
  final Function(String value)? onChanged;
  const InputPasswordWidget({Key? key, this.onChanged}) : super(key: key);

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
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
