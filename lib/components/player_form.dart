import 'package:flutter/material.dart';

typedef PlayerCallback = void Function(String p1, String p2);

class PlayerForm extends StatefulWidget {
  const PlayerForm({super.key, required this.callbackPlayers});

  final PlayerCallback callbackPlayers;

  @override
  State<PlayerForm> createState() => _PlayerFormState();
}

class _PlayerFormState extends State<PlayerForm> {
  final _formKey = GlobalKey<FormState>();
  final j1controller = TextEditingController();
  final j2controller = TextEditingController();

  @override
  void dispose() {
    j1controller.dispose();
    j2controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 64),
        child: Column(
          children: [
            TextFormField(
              validator: (value) => value == null || value.isEmpty
                  ? 'Veuillez renseigner un nom de joueur'
                  : null,
              controller: j1controller,
              cursorColor: Theme.of(context).primaryColorDark,
              decoration: const InputDecoration(
                labelText: 'Nom du joueur 1',
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              validator: (value) => value == null || value.isEmpty
                  ? 'Veuillez renseigner un nom de joueur'
                  : null,
              controller: j2controller,
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
              onPressed: () => {
                if (_formKey.currentState!.validate())
                  {
                    widget.callbackPlayers(
                        j1controller.text, j2controller.text),
                  }
              },
              child: const Text("Jouer !"),
            ),
          ],
        ),
      ),
    );
  }
}
