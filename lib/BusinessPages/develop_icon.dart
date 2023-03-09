import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';

class DevelopIcon extends StatelessWidget {
  const DevelopIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            Icons.build,
            color: AppColors.gray,
            size: 16.0,
          ),
        ),
      ),
    );
  }
}
