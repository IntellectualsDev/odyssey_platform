import 'package:flutter/material.dart';
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

    double sectionsFontSizeLarge = screenWidth / 80;
    double titleFontSizeLarge = screenWidth / 60;
    double sectionsFontSizeShort = screenWidth / 60;
    double titleFontSizeShort = screenWidth / 20;

    return NotificationListener<ScrollUpdateNotification>(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return _desktopNavBar(sectionsFontSizeLarge, titleFontSizeLarge);
          } else {
            return _shorterDisplayNavBar(
                sectionsFontSizeShort, titleFontSizeShort);
          }
        },
      ),
    );
  }

//navbar para displays mas cortos que una desktop pero mas grandes que un celular pequeno
  Widget _shorterDisplayNavBar(double sectionsFontSize, double titleFontSize) =>
      Container(
        color: MyColors.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (globals.sideBar != 0) {
                      Navigator.pushNamed(context, "/");
                    }
                  },
                  child: Text(
                    "The Odyssey",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColors.action,
                      fontSize: titleFontSize,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (globals.sideBar == 1)
                      _selectedNavBarButton("My Games", sectionsFontSize)
                    else
                      _navBarButton("My Games", "/games", sectionsFontSize),
                    const SizedBox(width: 30),
                    if (globals.sideBar == 2)
                      _selectedNavBarButton("Store", sectionsFontSize)
                    else
                      _navBarButton("Store", "/store", sectionsFontSize),
                    const SizedBox(width: 30),
                    MaterialButton(
                        color: MyColors.action,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        onPressed: (() =>
                            {Navigator.pushNamed(context, "/authentication")}),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: Text(
                            "Sign up/Log in",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      );

//navbar para desktop grande
  Widget _desktopNavBar(double sectionsFontSize, double titleFontSize) =>
      Container(
        color: MyColors.background,
        child: Padding(
          padding: EdgeInsets.all(sectionsFontSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              
              MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
              onTap: () {
                if (globals.sideBar != 0) {
                  Navigator.pushNamed(context, "/");
                }
              },
              child: Text(
                "The Odyssey",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColors.action,
                  fontSize: titleFontSize,
                ),
              ),
                              ),
                            ),
                            
              if (globals.sideBar == 1)
                _selectedNavBarButton("My Games", sectionsFontSize)
              else
                _navBarButton("My Games", "/games", sectionsFontSize),
              if (globals.sideBar == 2)
                _selectedNavBarButton("Store", sectionsFontSize)
              else
                _navBarButton("Store", "/store", sectionsFontSize),
              const SizedBox(width: 30),
              MaterialButton(
                  color: MyColors.action,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  onPressed: (() =>
                      {Navigator.pushNamed(context, "/authentication")}),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    child: Text(
                      "Sign up/Log in",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ))
            ],
          ),
        ),
      );

//botton que no tiene funcionalidad pero es para el diseno para mostrar la pagina en donde el usuario esta en la navbar
  Widget _selectedNavBarButton(String text, double fontSize) => TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: fontSize, decoration: TextDecoration.underline, decorationColor: Colors.white,decorationThickness: 2),
        ),
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
