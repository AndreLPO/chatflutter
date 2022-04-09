import 'package:flutter/material.dart';

class MensagemEnviada extends StatelessWidget {
  final String mensagem;

  const MensagemEnviada({Key? key, required this.mensagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: Text(
          mensagem,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
