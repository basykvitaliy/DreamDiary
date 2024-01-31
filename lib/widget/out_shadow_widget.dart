import 'package:dream_diary/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class OutShadowWidget {
  List<BoxShadow> showOutShadow() {
    return [
      BoxShadow(
        blurRadius: 7,
        offset: -Offset(2, 2),
        color: AppColors.secondColor,
      ),
      BoxShadow(
        blurRadius: 7,
        offset: Offset(4, 4),
        color: AppColors.secondColor.withOpacity(0.5),
      ),
    ];
  }
}
