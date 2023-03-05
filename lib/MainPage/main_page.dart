import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/CustomerPages/main_grid.dart';
import 'package:mobile/utils/app_colors.dart';

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
        backgroundColor: AppColors.gray,
        title: Text(
          AppLocalizations.of(context).mainPage_name,
        ),
      ),
      body: Column(
        children: const [
          Expanded(
            child: MainGrid(),
          ),
        ],
      ),
    );
  }
}
