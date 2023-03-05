// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile/CustomerPages/customer_tile.dart';
import 'package:mobile/utils/screens.dart';

class MainGrid extends StatefulWidget {
  const MainGrid({super.key});

  @override
  State<MainGrid> createState() => _MainGridState();
}

class _MainGridState extends State<MainGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      crossAxisCount: 5,
      primary: false,
      padding: const EdgeInsets.all(24),
      children: const [
        CustomerTile(
          name: "Example app 1",
          routeName: Screens.mainApp,
        ),
        CustomerTile(
          name: "Example app 2",
          routeName: Screens.mainApp,
        ),
        CustomerTile(
          name: "Example app 3",
          routeName: Screens.mainApp,
        ),
        CustomerTile(
          name: "Example app 4",
          routeName: Screens.mainApp,
        ),
        CustomerTile(
          name: "Example app 5",
          routeName: Screens.mainApp,
        ),
        CustomerTile(
          name: "Example app 6",
          routeName: Screens.mainApp,
        ),
      ],
    );
  }
}
