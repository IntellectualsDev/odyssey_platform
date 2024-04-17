import 'package:flutter/material.dart';
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
    return Container(decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'), // Replace 'background_image.jpg' with your image file
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          child: Row(children: [SideBar()],),);
  }
}