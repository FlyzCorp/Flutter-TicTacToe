import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Case extends StatelessWidget {
  final int state;
  final Function onTap;
  const Case({super.key, this.state = 0, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget? displayed;

    if (state > 0) {
      displayed = SvgPicture.asset(
        'assets/img/o.svg',
        color: const Color(0xFF774C60),
      );
    } else if (state < 0) {
      displayed = SvgPicture.asset(
        'assets/img/x.svg',
        color: const Color(0xFF372549),
      );
    } else {
      displayed = null;
    }

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 5,
            strokeAlign: StrokeAlign.center,
          ),
        ),
        alignment: Alignment.center,
        child: displayed,
      ),
    );
  }
}
