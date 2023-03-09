import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';

class SponsorIcon extends StatelessWidget {
  final bool isDeveloped;

  const SponsorIcon({
    required this.isDeveloped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8 + (isDeveloped ? 28 : 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            Icons.star,
            color: AppColors.white,
            size: 16.0,
          ),
        ),
      ),
    );
  }
}
