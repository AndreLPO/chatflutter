import 'package:chatflutter/modules/Chat/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

ChatModel model = ChatModel();

CollectionReference mensagens =
    FirebaseFirestore.instance.collection('mensagens');

class ChatController {
  final textController = TextEditingController();
  String teste = '';

  adicionaMensagem(ChatModel dadosMensagem) async {
    await mensagens.add({
      'de': dadosMensagem.de,
      'horarioEnvio': DateTime.now(),
      'mensagem': dadosMensagem.mensagem,
    });
  }
}

class Mensagem extends ValueNotifier {
  Mensagem() : super("");
  digita() => model.mensagem = value;
}
