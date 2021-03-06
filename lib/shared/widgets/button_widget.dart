import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key, required this.onClick, required this.texto})
      : super(key: key);
  final VoidCallback onClick;
  final String texto;
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.onClick, child: Text(widget.texto));
  }
}
