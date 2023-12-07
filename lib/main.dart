import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/screens/game_screen.dart';
import 'package:tic_tac_toe_game/screens/game_splash_screen.dart';


void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          backgroundColor: Colors.redAccent,
          splash: const GameSplash(),
          nextScreen: const GameScreen(),
          duration: 2000),
    );
  }
}
