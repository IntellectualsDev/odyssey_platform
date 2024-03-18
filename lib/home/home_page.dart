import 'package:flutter/material.dart';
import 'package:odyssey_platform/nav_bar/NavBar.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
        double width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
         children: <Widget>[
              StickyHeader(
                header: (width > 600)
                    ? NavBar()
                    : Container(), //only show the navigation bar if the app bar is not there so just when the display is big enough
                content: Container(
                  
                  child: const Column(
                    children: [
                      Placeholder(),
                    ],
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}
