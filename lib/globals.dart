
library personal_portfolio.globals;

import 'package:flutter/foundation.dart';


int sideBar = 0; //keep track of the current page loaded by the sidebar 
int homePageSelection = 0;//keept track of what to show on home page
int game = 0; //keep track of the selected game 
ValueNotifier<bool> signedIn = ValueNotifier<bool>(false);//keep track if user is signed in or not
String? userEmail = "";

