import 'package:flutter/material.dart';

import 'card_form_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe"),
      ),
      body: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardFromScreen(),
            )),
        title: const Text("Go to Card Form"),
        trailing: const Icon(Icons.chevron_right_outlined),
      ),
    );
  }
}
