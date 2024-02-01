import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'button_widget.dart';

class BuyPremiumWidget extends StatelessWidget {
   BuyPremiumWidget({
    super.key,
    required this.onTap
  });

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.bgElements),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Need Premium",
                style: GoogleFonts.epilogue(
                  textStyle: AppStyles.regularWhite22,
                ),
              ),
              Text(
                "You need premium for this mode, let's buy it.",
                style: GoogleFonts.mulish(
                    textStyle: AppStyles.regularWhiteText,
                    color: AppColors.gray,
                    fontWeight: FontWeight.bold
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 50
                  ),
                  ButtonWidget(
                    width: 200,
                    title: 'BUY PREMIUM',
                    isDisabledBtn: false,
                    onTap: onTap,
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            left: 16,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: Image.asset(
                'assets/images/flower.png',
                color: AppColors.gray.withOpacity(0.3),
                scale: 1.5,
              ),
            ))
      ],
    );
  }
}