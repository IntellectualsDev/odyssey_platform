import 'package:flutter/material.dart';
import 'package:odyssey_platform/nav_bar/NavBar.dart';
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