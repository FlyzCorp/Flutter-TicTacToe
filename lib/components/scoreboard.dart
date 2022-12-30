import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreBoard extends StatelessWidget {
  final int p1Score, p2Score;
  final String p1Name, p2Name;
  const ScoreBoard(
      {super.key,
      required this.p1Name,
      required this.p2Name,
      required this.p1Score,
      required this.p2Score});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 64, bottom: 64),
      padding: const EdgeInsets.all(8),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/img/o.svg',
                width: 32,
                color: const Color(0xFF372549),
              ),
              Text(
                p1Name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ],
          ),
          BorderedText(
            strokeWidth: 5,
            strokeColor: Theme.of(context).backgroundColor,
            child: Text(
              "$p1Score - $p2Score",
              style: const TextStyle(
                fontSize: 32,
                color: Color(0xFFB75D69),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                p2Name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              SvgPicture.asset(
                'assets/img/x.svg',
                width: 32,
                color: const Color(0xFF372549),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
