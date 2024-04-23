import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:odyssey_platform/globals.dart' as globals;

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<StatefulWidget> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Color _navbarColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double sectionsFontSizeLarge = screenWidth / 80;
    double textButtonsHeight = screenHeight / 40;

    return NotificationListener<ScrollUpdateNotification>(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                (globals.homePageSelection == 0)
                    ? _selectedNavBarButton("My Games", textButtonsHeight)
                    : _navBarButton("My Games", '/', textButtonsHeight),
                const SizedBox(
                  width: 20,
                ),
                (globals.homePageSelection == 1)
                    ? _selectedNavBarButton("What's New", textButtonsHeight)
                    : _navBarButton("What's New", '/news', textButtonsHeight)
              ],
            ),
          ),
        );
        ;
      }),
    );
  }

//botton que no tiene funcionalidad pero es para el diseno para mostrar la pagina en donde el usuario esta en la navbar
  Widget _selectedNavBarButton(String text, double fontSize) => Column(
    children: [
      Container(
            color: Color.fromRGBO(128, 128, 128, 0.2), // Example color
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
              child: TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                          // decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
    ],
  );

  //navBarbutton, en la navbar son los botones para navegar a las otras paginas
  Widget _navBarButton(String text, String path, double fontSize) => TextButton(
        onPressed: () {
          Navigator.pushNamed(context, path);
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      );
}
