import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:solutions_itd_mobile/MainPage/drawer_item.dart';
import 'package:solutions_itd_mobile/main.dart';
import 'package:solutions_itd_mobile/utils/app_data.dart';

class MainPageDrawer extends StatefulWidget {
  final Function refresh;
  const MainPageDrawer({
    required this.refresh,
    super.key,
  });

  @override
  State<MainPageDrawer> createState() => _MainPageDrawerState();
}

class _MainPageDrawerState extends State<MainPageDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        heightFactor: 2.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (appData.user?.pictureUrl != null)
              Container(
                margin: const EdgeInsets.all(12),
                child: CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child: Image.network(
                      appData.user!.pictureUrl.toString(),
                    ),
                  ),
                ),
              ),
            if (appData.user?.name != null ||
                appData.user?.nickname != null ||
                appData.user?.email != null)
              Text(
                AppLocalizations.of(context).mainPage_loggedInAs(
                  appData.user!.name ??
                      appData.user!.nickname ??
                      appData.user!.email!,
                ),
              ),
            if (appData.user == null)
              DrawerButton(
                onPressed: () {
                  authApi.authenticate(parentLoadingContext: context).then((_) {
                    Navigator.of(context).pop();
                    setState(() {});
                    widget.refresh();
                  });
                },
                iconData: Icons.person,
                text: AppLocalizations.of(context).mainPage_authenticate,
              ),
            if (appData.user != null)
              DrawerButton(
                onPressed: () {
                  authApi
                      .unauthenticate(parentLoadingContext: context)
                      .then((_) {
                    Navigator.of(context).pop();
                    setState(() {});
                    widget.refresh();
                  });
                },
                iconData: Icons.logout,
                text: AppLocalizations.of(context).mainPage_logout,
              ),
          ],
        ),
      ),
    );
  }
}
