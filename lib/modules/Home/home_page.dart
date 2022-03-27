import 'package:chatflutter/modules/Home/chat_controller.dart';
import 'package:chatflutter/modules/Home/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final user = FirebaseAuth.instance.currentUser!;
ChatModel model = ChatModel();
ChatController controller = ChatController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
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
      appBar: AppBar(title: const Text("Home Page")),
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
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(
                        data['de'],
                        textAlign: data['de'] == user.email
                            ? TextAlign.end
                            : TextAlign.start,
                      ),
                      subtitle: Text(
                        data['mensagem'],
                        textAlign: data['de'] == user.email
                            ? TextAlign.end
                            : TextAlign.start,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: "Mensagem"),
                    onChanged: (String mensagem) => model.mensagem = mensagem,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  child: const Text("Enviar"),
                  onPressed: () async {
                    await controller.adicionaMensagem(model);
                    _controller.clear();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
