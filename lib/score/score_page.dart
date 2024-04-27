import 'package:flutter/material.dart';
import 'package:odyssey_platform/game/chess_board.dart';
import 'package:odyssey_platform/globals.dart';
import 'package:odyssey_platform/side_bar.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return ChessBoard();
  }
}