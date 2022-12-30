import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 48),
        child: BorderedText(
          strokeWidth: 10,
          strokeColor: const Color(0xFFEACDC2),
          child: const Text(
            "TICTACTOE",
            style: TextStyle(
              fontFamily: 'Unbounded',
              fontWeight: FontWeight.w900,
              fontSize: 36,
              color: Color(0xFFB75D69),
            ),
          ),
        ),
      ),
    );
  }
}
