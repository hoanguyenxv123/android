import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_icons.dart';

class ButtonAddnew extends StatelessWidget {
  const ButtonAddnew({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              AppColors.hexDE83B0,
              AppColors.hexC59ADF,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(
            AppIcons.plus,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
