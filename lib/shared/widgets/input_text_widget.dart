import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  Function(String value)? onChanged;
  InputTextWidget({Key? key, this.controller, required this.onChanged})
      : super(key: key);
  final TextEditingController? controller;
  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: const InputDecoration(
        label: Text("Login"),
        border: OutlineInputBorder(),
      ),
    );
  }
}
