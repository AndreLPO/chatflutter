import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: Colors.black)),
        const Text(" ou "),
        Expanded(child: Container(height: 1, color: Colors.black)),
      ],
    );
  }
}
