import 'package:solutions_itd_mobile/BusinessPages/business_data.dart';
import 'package:solutions_itd_mobile/utils/screens.dart';

List<BusinessData> companies = [
  BusinessData(
    name: "Example app 1",
    routeName: Screens.mainApp,
    logoPath: "assets/example_app_icon.png",
    keywords: const ["example", "app", "1"],
  ),
  BusinessData(
    name: "Example app 2",
    routeName: Screens.mainApp,
    keywords: const ["example", "app", "2"],
  ),
  BusinessData(
    name: "Example app 3",
    routeName: Screens.mainApp,
    logoPath: "assets/example_app_icon.png",
    isDeveloped: true,
    keywords: const ["example", "app", "3"],
  ),
  BusinessData(
    name: "Example app 3",
    routeName: Screens.mainApp,
    logoPath: "assets/example_app_icon.png",
    isSponsored: true,
    keywords: const ["example", "app", "3"],
  ),
  BusinessData(
    name: "Example app 4",
    routeName: Screens.mainApp,
    isDeveloped: true,
    keywords: const ["example", "app", "4"],
  ),
  BusinessData(
    name: "Example app 5",
    routeName: Screens.mainApp,
    isSponsored: true,
    isDeveloped: true,
    keywords: const ["example", "app", "5"],
  ),
  BusinessData(
    name: "Example app 6",
    routeName: Screens.mainApp,
    isSponsored: true,
    keywords: const ["example", "app", "6"],
  ),
];
