import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

import 'dice.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ShakeDetector detector;
  int diceValue1 = 6;
  int diceValue2 = 6;
  String message = 'Tap or Shake';

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        roll();
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 250,
      shakeCountResetTime: 250,
      shakeThresholdGravity: 2.5,
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  void roll() {
    diceValue1 = Random().nextInt(6) + 1;
    diceValue2 = Random().nextInt(6) + 1;
    message = (diceValue1 + diceValue2).toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        roll();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF171717),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Dice 1
              // Dice 2
              Dice(diceValue1),
              const SizedBox(
                height: 24.0,
              ),
              Dice(diceValue2),
              const SizedBox(
                height: 72.0,
              ),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF767676),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
