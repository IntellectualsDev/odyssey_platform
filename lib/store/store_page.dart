import 'package:flutter/material.dart';
import 'package:odyssey_platform/nav_bar/NavBar.dart';
import 'package:odyssey_platform/side_bar.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Container(decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'), // Replace 'background_image.jpg' with your image file
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          child: Row(children: [SideBar()],),)
    );
  }
}