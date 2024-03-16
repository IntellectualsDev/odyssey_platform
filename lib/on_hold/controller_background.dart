import 'package:flutter/material.dart';

class ControllerBackground extends StatelessWidget {
  const ControllerBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ClipRect(
        child: Image(
          image: AssetImage("assets/consoleBackground.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
