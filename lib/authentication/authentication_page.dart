import 'package:flutter/material.dart';
import 'package:odyssey_platform/nav_bar/NavBar.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
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