import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/BusinessPages/ExampleBusiness/example_business_page.dart';
import 'package:solutions_itd_mobile/MainPage/main_page.dart';
import 'package:solutions_itd_mobile/utils/screens.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case Screens.mainApp:
        screen = const MainPage();
        break;
      case Screens.exampleBusinessApp:
        screen = const ExampleBusinessPage();
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
