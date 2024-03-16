import 'package:flutter/material.dart';
import 'package:odyssey_platform/authentication/authentication_page.dart';
import 'package:odyssey_platform/game_selection.dart';
import 'package:odyssey_platform/home/home_page.dart';
import 'package:odyssey_platform/landing_page.dart';
import 'package:odyssey_platform/store/store_page.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:url_strategy/url_strategy.dart';


void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Odyssey Platform',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        String path = '/';

        if (settings.name != null) {
          final uri = Uri.parse(settings.name!);
          path = uri.path;
        }

        if (path == "/") {

          return PageRouteBuilder(
            //remove animation by setting the transition duration to 0 so it appears to just change tabs 
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) =>  const HomePage(),
          );
        }
        if (path == "/store") {

          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const StorePage(),
          );
        }
        if (path == "/authentication") {
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const AuthenticationPage(),
          );
        }
        
     
      },
     
      theme: ThemeData(
          primaryColor: MyColors.action,
          fontFamily: "Montserrat",
          scaffoldBackgroundColor: MyColors.background),
      debugShowCheckedModeBanner: false,
    );
  }
}






