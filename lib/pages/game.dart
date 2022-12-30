import 'dart:developer';

import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow, Title;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:tictactoe/components/case.dart';
import 'package:tictactoe/components/scoreboard.dart';
import 'package:tictactoe/components/title.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final String p1Name = 'Joueur 1';
  final String p2Name = 'Joueur 2';
  int p1Score = 0, p2Score = 0;
  int turn = 0;
  int playerTurn = 1; //1 is P1, -1 is P2
  List<List<int>> game = List.generate(3, (_) => List.filled(3, 0));

  void handleGameState(int x, int y) {
    if (game[x][y] == 0) {
      setState(() {
        turn++;
        game[x][y] = playerTurn;
        playerTurn = playerTurn > 0 ? -1 : 1;
      });
      int winner = isSomeoneWinning();
      if (winner != 0) {
        //log("Winner $winner");
        setState(() {
          winner > 0 ? p1Score++ : p2Score++;
          game = List.generate(3, (_) => List.filled(3, 0));
          turn = 0;
        });
      }

      if (turn >= 9) {
        setState(() {
          game = List.generate(3, (_) => List.filled(3, 0));
        });
      }
    }
  }

  int isSomeoneWinning() {
    //Compute sum in 3 direction.
    //Compute sum of all rows
    for (int y = 0; y < 3; y++) {
      int sum = 0;
      for (int x = 0; x < 3; x++) {
        sum += game[y][x];
      }
      if (sum >= 3) {
        return 1;
      } else if (sum <= -3) {
        return -1;
      }
    }

    //Compute sum of all columns
    for (int y = 0; y < 3; y++) {
      int sum = 0;
      for (int x = 0; x < 3; x++) {
        sum += game[x][y];
      }
      if (sum >= 3) {
        return 1;
      } else if (sum <= -3) {
        return -1;
      }
    }

    //Compute sum of all diags
    if (game[0][0] + game[1][1] + game[2][2] >= 3 ||
        game[0][2] + game[1][1] + game[2][0] >= 3) {
      return 1;
    } else if (game[0][0] + game[1][1] + game[2][2] >= 3 ||
        game[0][2] + game[1][1] + game[2][0] <= -3) {
      return -1;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Title(),
          ScoreBoard(
            p1Name: p1Name,
            p2Name: p2Name,
            p1Score: p1Score,
            p2Score: p2Score,
          ),
          BorderedText(
            strokeWidth: 5,
            strokeColor: const Color(0xFFEACDC2),
            child: Text(
              "${playerTurn > 0 ? p1Name : p2Name} turn",
              style: const TextStyle(
                fontSize: 24,
                color: Color(0xFFB75D69),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              margin: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFFEACDC2),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: Offset(0, 4),
                    color: Color.fromARGB(175, 0, 0, 0),
                    inset: true,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Case(
                        state: game[0][0],
                        onTap: () => handleGameState(0, 0),
                      ),
                      Case(
                        state: game[0][1],
                        onTap: () => handleGameState(0, 1),
                      ),
                      Case(
                        state: game[0][2],
                        onTap: () => handleGameState(0, 2),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Case(
                        state: game[1][0],
                        onTap: () => handleGameState(1, 0),
                      ),
                      Case(
                        state: game[1][1],
                        onTap: () => handleGameState(1, 1),
                      ),
                      Case(
                        state: game[1][2],
                        onTap: () => handleGameState(1, 2),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Case(
                        state: game[2][0],
                        onTap: () => handleGameState(2, 0),
                      ),
                      Case(
                        state: game[2][1],
                        onTap: () => handleGameState(2, 1),
                      ),
                      Case(
                        state: game[2][2],
                        onTap: () => handleGameState(2, 2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
