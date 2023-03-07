import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:solutions_itd_mobile/Authentication/auth.dart';
import 'package:solutions_itd_mobile/BusinessPages/main_grid.dart';
import 'package:solutions_itd_mobile/MainPage/drawer_item.dart';
import 'package:solutions_itd_mobile/MainPage/logo.dart';
import 'package:solutions_itd_mobile/MainPage/main_page_filter_provider.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:solutions_itd_mobile/utils/app_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: AppColors.gray,
        title: const Center(
          child: AppLogo(),
        ),
        actions: [
          if (appData.user?.profileUrl != null)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: CircleAvatar(
                radius: 56,
                child: ClipOval(
                  child: Image.network(
                    appData.user!.profileUrl.toString(),
                  ),
                ),
              ),
            ),
        ],
      ),
      drawer: Drawer(
        child: Center(
          heightFactor: 2.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (appData.user == null)
                DrawerButton(
                  onPressed: () {
                    AuthAPI.authenticate(loadingContext: context);
                    Navigator.of(context).pop();
                  },
                  iconData: Icons.person,
                  text: AppLocalizations.of(context).mainPage_authenticate,
                ),
              DrawerButton(
                onPressed: () {
                  AuthAPI.unauthenticate(loadingContext: context);
                  Navigator.of(context).pop();
                },
                iconData: Icons.logout,
                text: AppLocalizations.of(context).mainPage_logout,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: MainGrid(),
          ),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).mainPage_search,
              ),
              autocorrect: true,
              enableSuggestions: true,
              onChanged: (value) {
                Provider.of<MainPageProvider>(context, listen: false)
                    .setFilter(value.toLowerCase());
              },
            ),
          ),
        ],
      ),
    );
  }
}
