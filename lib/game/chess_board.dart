import 'package:flutter/material.dart';

class ChessBoard extends StatefulWidget {
  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width, // Making it square
      child: Column(
        children: List.generate(
          8,
          (rowIndex) => Expanded(
            child: Row(
              children: List.generate(
                8,
                (colIndex) {
                  final color =
                      (rowIndex + colIndex) % 2 == 0 ? Colors.white : Colors.black;
                  return Expanded(
                    child: Container(
                      color: color,
                      child: Center(
                        child: Text(
                          "${rowIndex * 8 + colIndex}",
                          
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
