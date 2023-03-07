import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/Authentication/loginCallback.dart';
import 'package:solutions_itd_mobile/Authentication/logoutCallback.dart';
import 'package:solutions_itd_mobile/MainPage/main_page.dart';
import 'package:solutions_itd_mobile/utils/screens.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case Screens.mainApp:
        screen = const MainPage();
        break;
      case Screens.loginCallback:
        screen = const LoginCallbackScreen();
        break;
      case Screens.logoutCallback:
        screen = const LogoutCallbackScreen();
        break;
      default:
        screen = const MainPage();
        break;
    }
    return MaterialPageRoute(
      builder: (context) => screen,
      settings: settings,
    );
  }
}
