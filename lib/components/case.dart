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
        color: Theme.of(context).primaryColorDark,
      );
    } else if (state < 0) {
      displayed = SvgPicture.asset(
        'assets/img/x.svg',
        color: Theme.of(context).backgroundColor,
      );
    } else {
      displayed = null;
    }

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 80,
        height: 80,
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
