import 'package:flutter/material.dart';


class ControllerButton extends StatelessWidget {

final String letter; 
final Color color;

  const ControllerButton({
    super.key,
    required this.letter,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          Colors.black, // Color of the circle
      radius: 15, // Radius of the circle
      child: Text(
        letter, // Letter inside the circle
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color, // Color of the letter
          fontSize: 15, // Font size of the letter
        ),
      ),
    );
  }
}