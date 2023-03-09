import 'package:flutter/material.dart';

class BusinessAppBar extends StatefulWidget {
  const BusinessAppBar({super.key});

  @override
  State<BusinessAppBar> createState() => _BusinessAppBarState();
}

class _BusinessAppBarState extends State<BusinessAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('BottomNavigationBar Sample'),
    );
  }
}
