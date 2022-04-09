import 'package:flutter/material.dart';

class ChatInfo extends StatefulWidget {
  const ChatInfo({Key? key}) : super(key: key);

  @override
  State<ChatInfo> createState() => _ChatInfoState();
}

class _ChatInfoState extends State<ChatInfo> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "teste",
                child: SizedBox(
                  height: 350,
                  child: Center(
                    child: CircleAvatar(
                      radius: 120,
                      child: Icon(
                        Icons.group,
                        size: 120,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: const [
                    Text(
                      "Nome do grupo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Quantidade de membros",
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ])),
          )
        ],
      ),
    );
  }
}
