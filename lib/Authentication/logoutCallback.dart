import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:solutions_itd_mobile/MainPage/logo.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';

class LogoutCallbackScreen extends StatefulWidget {
  const LogoutCallbackScreen({super.key});

  @override
  State<LogoutCallbackScreen> createState() => _LogoutCallbackScreenState();
}

class _LogoutCallbackScreenState extends State<LogoutCallbackScreen> {
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
          Text("Logged out."),
        ],
      ),
    );
  }
}
