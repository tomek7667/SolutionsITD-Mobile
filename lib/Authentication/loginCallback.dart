import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/MainPage/logo.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';

class LoginCallbackScreen extends StatefulWidget {
  const LoginCallbackScreen({super.key});

  @override
  State<LoginCallbackScreen> createState() => _LoginCallbackScreenState();
}

class _LoginCallbackScreenState extends State<LoginCallbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: AppColors.gray,
        title: const Center(
          child: AppLogo(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Logged in."),
        ],
      ),
    );
  }
}
