import 'package:flutter/material.dart';

class GameSelection extends StatefulWidget {
  const GameSelection({super.key});

  @override
  State<GameSelection> createState() => _GameSelectionState();
}

class _GameSelectionState extends State<GameSelection> {
  @override
  Widget build(BuildContext context) {
    return  Container(color: Colors.blueAccent , width:50, height: 200, child: Column(children: [Container(width:50 ,child: Text("This goes inside", overflow: TextOverflow.clip,)),Text("this too")]),);
  }
}