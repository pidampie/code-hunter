import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/code_hunter_game.dart';

class GameScreen extends StatelessWidget {
  final String levelFile; // Menerima nama file map (misal: 'level_1.tmx')

  const GameScreen({super.key, required this.levelFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(game: CodeHunterGame(levelName: levelFile)),
    );
  }
}
