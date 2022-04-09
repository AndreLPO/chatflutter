import 'package:chatflutter/modules/Chat/chat_model.dart';
import 'package:chatflutter/modules/Chat/chat_controller.dart';

import 'package:flutter/material.dart';

ChatController _controller = ChatController();

class DigitaMensagem extends StatefulWidget {
  const DigitaMensagem({Key? key, required this.model}) : super(key: key);

  final ChatModel model;

  @override
  State<DigitaMensagem> createState() => _DigitaMensagemState();
}

class _DigitaMensagemState extends State<DigitaMensagem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Color(0x34DDDDDD),
        border: Border(
          top: BorderSide(
            color: Color(0xFFDDDDDD),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextField(
              controller: _controller.textController,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.attach_file),
                ),
                hintText: "Mensagem",
                contentPadding: EdgeInsets.zero,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(999),
                  ),
                ),
              ),
              onChanged: (String mensagem) {
                widget.model.mensagem = mensagem;
                setState(() {});
              },
            ),
          ),
          IconButton(
            icon: widget.model.mensagem == ""
                ? const Icon(Icons.keyboard_voice)
                : const Icon(Icons.send_rounded),
            onPressed: () async {
              if (widget.model.mensagem != "") {
                _controller.textController.clear();
                await _controller.adicionaMensagem(widget.model);
                widget.model.mensagem = "";
              }
            },
          )
        ],
      ),
    );
  }
}
