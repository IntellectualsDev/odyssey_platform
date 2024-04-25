import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
// Get the MediaQueryData for the current context
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    double sectionsFontSizeLarge = screenWidth / 80;
    double textButtonsHeight = screenHeight / 35;

    return NotificationListener<ScrollUpdateNotification>(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                (globals.sideBar == 0)
                    ? (globals.homePageSelection == 0
                        ? _selectedNavBarButton("My Games", textButtonsHeight)
                        : _navBarButton("My Games", '/', textButtonsHeight))
                    : Container(),
                const SizedBox(
                  width: 20,
                ),
                (globals.sideBar == 0)
                    ? (globals.homePageSelection == 1)
                        ? _selectedNavBarButton("What's New", textButtonsHeight)
                        : _navBarButton(
                            "What's New", '/news', textButtonsHeight)
                    : Container(),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: MyColors.background,
                          content: Container(
                            width: screenWidth / 2,
                            height: screenHeight * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.all(50.0),
                              child: Column(
                                children: [
                                  Text("Welcome"),
                                  Text(
                                      "Enter your email or mobile number to login or create account. No password needed!"),
                                  Text("Email or mobile phone"),
                                  Container(
                                    width: (screenWidth / 2) * 0.8,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Adjust the radius as needed
                                        ),
                                        hintText: 'Enter email or mobile',
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Log in / Sign up")),
                                  Text("Or"),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Row(
                                        children: [
                                          Icon(FontAwesomeIcons.google),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text("Continue with google")
                                        ],
                                      )),
                                  Text(
                                      "By continuing you agree with the Odysseys terms and conditions and provacy policy")
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.action,
                    elevation: 4,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Sign in/Log in',
                        softWrap: false, // Text won't wrap to the next line
                        style: TextStyle(
                            color: Colors.white, fontSize: textButtonsHeight)),
                  ),
                ),
                SizedBox(
                  width: 40,
                )
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
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
          ),
          const SizedBox(height: 5), // Add some spacing between text and oval
          Container(
            width: 100,
            height: 5,
            decoration: BoxDecoration(
              color: MyColors.action,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      );

  //navBarbutton, en la navbar son los botones para navegar a las otras paginas
  Widget _navBarButton(String text, String path, double fontSize) => Column(
        children: [
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, path);
            },
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
}
