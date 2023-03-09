import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/BusinessPages/bottom_nagivation.dart';
import 'package:solutions_itd_mobile/BusinessPages/home_button.dart';
import 'package:solutions_itd_mobile/utils/logo.dart';
import 'package:solutions_itd_mobile/MainPage/user_avatar.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';
import 'package:solutions_itd_mobile/utils/app_data.dart';

class ExampleBusinessPage extends StatefulWidget {
  const ExampleBusinessPage({super.key});

  @override
  State<ExampleBusinessPage> createState() => _ExampleBusinessPageState();
}

class _ExampleBusinessPageState extends State<ExampleBusinessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const HomeButton(),
        toolbarHeight: 64,
        backgroundColor: AppColors.gray,
        title: const Center(
          child: AppLogo(
            logoPath: "assets/example_business_logo.png",
          ),
        ),
        actions: [
          UserAvatar(pictureUrl: appData.user?.pictureUrl),
        ],
      ),
      body: const BottomNavigation(),
    );
  }
}
