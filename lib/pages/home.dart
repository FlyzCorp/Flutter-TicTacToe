import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow, Title;
import 'package:tictactoe/components/player-form.dart';
import 'package:tictactoe/components/title.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Title(),
          PlayerForm(),
        ],
      ),
    );
  }
}
