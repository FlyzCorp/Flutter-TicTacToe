import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow, Title;
import 'package:tictactoe/components/player_form.dart';
import 'package:tictactoe/components/title.dart';
import 'package:tictactoe/pages/game.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Title(),
            PlayerForm(
              callbackPlayers: (p1, p2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(p1Name: p1, p2Name: p2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
