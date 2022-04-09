import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

final user = FirebaseAuth.instance.currentUser!;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ChatFlutter",
          style: TextStyle(color: Colors.black54),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black54),
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () {},
                  child: const Icon(
                    Icons.settings,
                    color: Colors.black45,
                  )),
              PopupMenuItem(
                  onTap: () async => await FirebaseAuth.instance.signOut(),
                  child: const Icon(
                    Icons.logout,
                    color: Colors.black45,
                  ))
            ],
          )
        ],
        backgroundColor: Colors.white70,
      ),
      body: ListView(children: [
        ListTile(
          onTap: () {
            Modular.to.pushNamed('/chat');
          },
          leading: const CircleAvatar(
            child: Icon(Icons.group),
          ),
          title: const Text("Grupo de Conversa"),
        )
      ]),
    );
  }
}
