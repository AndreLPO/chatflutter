import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonGoogle extends StatefulWidget {
  const ButtonGoogle({Key? key}) : super(key: key);

  @override
  State<ButtonGoogle> createState() => _ButtonGoogleState();
}

class _ButtonGoogleState extends State<ButtonGoogle> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: const [
          Icon(FontAwesomeIcons.google),
          SizedBox(width: 25),
          Text("Entrar com o google"),
        ]),
      ),
      onPressed: () {},
    );
  }
}
