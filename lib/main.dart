import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dice App by Amelia G.',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: Home(),
    );
  }
}