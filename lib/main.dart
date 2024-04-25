import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_platform/firebase_options.dart';
import 'package:odyssey_platform/game/game_page.dart';
import 'package:odyssey_platform/game_selection.dart';
import 'package:odyssey_platform/home/home_page.dart';
import 'package:odyssey_platform/home/news_page.dart';
import 'package:odyssey_platform/landing_page.dart';
import 'package:odyssey_platform/messages/messages_page.dart';
import 'package:odyssey_platform/score/score_page.dart';
import 'package:odyssey_platform/store/store_page.dart';
import 'package:odyssey_platform/theme/my_colors.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:odyssey_platform/globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
          globals.sideBar = 0;
          globals.homePageSelection = 0;
          debugPrint("mainPage");
          return PageRouteBuilder(
            //remove animation by setting the transition duration to 0 so it appears to just change tabs
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const HomePage(),
          );
        }
        if (path == "/news") {
          debugPrint("News Page");
          globals.sideBar = 0;
          globals.homePageSelection = 1;
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const NewsPage(),
          );
        }
        // if (path == "/games") {
        //   debugPrint("games");
        //   globals.sideBar = 1;
        //   return PageRouteBuilder(
        //     transitionDuration: Duration.zero,
        //     settings: settings,
        //     pageBuilder: (_, __, ___) => const GamePage(),
        //   );
        // }
        if (path == "/store") {
          globals.sideBar = 1;
          debugPrint("store");
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const StorePage(),
          );
        }
        if (path == "/messages") {
          globals.sideBar = 2;
          debugPrint("messages");
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const MessagesPage(),
          );
        }
        if (path == "/score") {
          globals.sideBar = 3;
          debugPrint("score");
          return PageRouteBuilder(
            transitionDuration: Duration.zero,
            settings: settings,
            pageBuilder: (_, __, ___) => const ScorePage(),
          );
        }
        // if (path == "/authentication") {
        //   debugPrint("authentication");
        //   return PageRouteBuilder(
        //     transitionDuration: Duration.zero,
        //     settings: settings,
        //     pageBuilder: (_, __, ___) => const AuthenticationPage(),
        //   );
        // }
        

      },
      theme: ThemeData(
          primaryColor: MyColors.action,
          fontFamily: "Montserrat",
          scaffoldBackgroundColor: MyColors.background),
      debugShowCheckedModeBanner: false,
    );
  }
}
