import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';

class AppLogo extends StatelessWidget {
  final String logoPath;

  const AppLogo({
    super.key,
    this.logoPath = "assets/logo_solutions_itd_small.png",
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
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
      child: Image(
        image: AssetImage(
          logoPath,
        ),
        height: 56,
      ),
    );
  }
}
