import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlayerForm extends StatefulWidget {
  const PlayerForm({super.key});

  @override
  State<PlayerForm> createState() => _PlayerFormState();
}

class _PlayerFormState extends State<PlayerForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 64),
        child: Column(
          children: [
            TextField(
              cursorColor: Theme.of(context).primaryColorDark,
              decoration: const InputDecoration(
                labelText: 'Nom du joueur 1',
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              cursorColor: Theme.of(context).primaryColorDark,
              decoration: const InputDecoration(
                labelText: 'Nom du joueur 2',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size.fromHeight(45),
              ),
              onPressed: () => {},
              child: const Text("Jouer !"),
            ),
          ],
        ),
      ),
    );
  }
}
