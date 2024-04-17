import 'package:flutter/material.dart';
import 'package:odyssey_platform/side_bar.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'), // Replace 'background_image.jpg' with your image file
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          child: Row(children: [SideBar()],),);;
  }
}