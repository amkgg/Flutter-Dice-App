import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Dice extends StatelessWidget {
  const Dice(this.value, {super.key});

  final int value;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/dice-$value.svg',
    );
  }
}