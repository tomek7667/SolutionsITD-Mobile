import 'package:flutter/material.dart';
import 'package:mobile/MainPage/main_page.dart';
import 'package:mobile/utils/screens.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case Screens.mainApp:
        screen = MainPage();
        break;
      default:
        screen = MainPage();
        break;
    }
    return MaterialPageRoute(
      builder: (context) => screen,
      settings: settings,
    );
  }
}
