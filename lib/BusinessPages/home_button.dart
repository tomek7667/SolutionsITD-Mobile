import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/utils/screens.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(Screens.mainApp);
      },
      icon: const Icon(Icons.home),
    );
  }
}
