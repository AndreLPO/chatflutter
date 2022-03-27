import 'package:chatflutter/modules/Home/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference mensagens =
    FirebaseFirestore.instance.collection('mensagens');

class ChatController {
  adicionaMensagem(ChatModel dadosMensagem) async {
    await mensagens.add({
      'de': dadosMensagem.de,
      'horarioEnvio': DateTime.now(),
      'mensagem': dadosMensagem.mensagem,
    });
  }
}
