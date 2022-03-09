import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: ElevatedButton(
        child: const Text('Logout'),
        onPressed: () async => await FirebaseAuth.instance.signOut(),
      ),
    );
  }
}
