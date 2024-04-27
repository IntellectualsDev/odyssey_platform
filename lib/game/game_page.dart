import 'package:flutter/material.dart';
import 'package:odyssey_platform/game/chess_board.dart';
import 'package:odyssey_platform/nav_bar/NavBar.dart';
import 'package:sticky_headers/sticky_headers.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: ChessBoard(),
    );
  }
}