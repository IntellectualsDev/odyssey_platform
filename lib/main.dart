import 'package:flutter/material.dart';
import 'package:odyssey_platform/authentication/authentication_page.dart';
import 'package:odyssey_platform/game/game_page.dart';
import 'package:odyssey_platform/game_selection.dart';
import 'package:odyssey_platform/home/home_page.dart';
import 'package:odyssey_platform/landing_page.dart';
import 'package:odyssey_platform/store/store_page.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:odyssey_platform/globals.dart' as globals;


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
          globals.page = 0;
          debugPrint("mainPage");
          return PageRouteBuilder(
            //remove animation by setting the transition duration to 0 so it appears to just change tabs
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const HomePage(),
          );
        }
         if (path == "/games") {
          debugPrint("games");
          globals.page = 1;
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const GamePage(),
          );
        }
        if (path == "/store") {
          globals.page = 2;
          debugPrint("store");
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const StorePage(),
          );
        }
        if (path == "/authentication") {
          globals.page = 3;
          debugPrint("authentication");
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
