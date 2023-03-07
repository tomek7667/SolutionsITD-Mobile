import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.gradients,
        ),
        border: Border.all(
          color: AppColors.darkGray,
          width: 0.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.elliptical(24, 24),
        ),
      ),
      child: const Image(
        image: AssetImage(
          "assets/logo_solutions_itd_small.png",
        ),
        height: 56,
      ),
    );
  }
}
