import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  Function(String value)? onChanged;
  String? Function(String? value)? validator;
  String label;
  InputTextWidget(
      {Key? key,
      required this.label,
      required this.onChanged,
      required this.validator})
      : super(key: key);
  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        label: Text(widget.label),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
