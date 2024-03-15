import 'package:flutter/material.dart';


class ControllerButton extends StatelessWidget {
  const ControllerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          Colors.black, // Color of the circle
      radius: 15, // Radius of the circle
      child: Text(
        'A', // Letter inside the circle
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green, // Color of the letter
          fontSize: 15, // Font size of the letter
        ),
      ),
    );
  }
}