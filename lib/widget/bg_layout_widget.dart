import 'package:dream_diary/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class BgLayoutWidget extends StatelessWidget {
  BgLayoutWidget({
    Key? key,
    this.height,
    this.radius
  }) : super(key: key);

  double? height;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
          color: AppColors.bgElements,
          borderRadius: BorderRadius.circular(radius ?? 30),

      ),

    );
  }
}