import 'package:chatflutter/modules/Chat/chat_controller.dart';
import 'package:chatflutter/modules/Chat/chat_model.dart';
import 'package:chatflutter/shared/widgets/digita_mensagem_widget.dart';
import 'package:chatflutter/shared/widgets/mensagem_enviada_widget.dart';
import 'package:chatflutter/shared/widgets/mensagem_recebida_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

final user = FirebaseAuth.instance.currentUser!;
ChatModel model = ChatModel();
ChatController controller = ChatController();

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final Stream<QuerySnapshot> _messageStream = FirebaseFirestore.instance
      .collection('mensagens')
      .orderBy('horarioEnvio', descending: true)
      .snapshots();
  @override
  void initState() {
    model.de = user.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black54),
        titleSpacing: 0,
        title: TextButton(
          onPressed: () {
            Modular.to.pushNamed('/chat_info');
          },
          child: Row(
            children: [
              const Hero(
                tag: "teste",
                child: CircleAvatar(
                  child: Icon(Icons.group),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Grupo de Conversa",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Clique para ver os membros",
                    style: TextStyle(color: Colors.black38, fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _messageStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return ListTile(
                      onLongPress: () {},
                      title: data['de'] == user.email
                          ? MensagemEnviada(mensagem: data['mensagem'])
                          : MensagemRecebida(mensagem: data['mensagem']),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          DigitaMensagem(
            model: model,
          ),
        ],
      ),
    );
  }
}
