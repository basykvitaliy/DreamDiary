import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:dream_diary/widget/out_shadow_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    Key? key,
    this.height,
    this.width,
    required this.title,
    this.onTap,
    this.isDisabledBtn,
  }) : super(key: key);

  double? width;
  double? height;
  String title;
  final VoidCallback? onTap;
  bool? isDisabledBtn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isDisabledBtn! ? onTap : null,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.secondColor,
          boxShadow: OutShadowWidget().showOutShadow(),
        ),
        child: Center(
          child: Text(title,
              style: GoogleFonts.mulish(
                textStyle: AppStyles.regularMainHeading,
                fontWeight: FontWeight.bold
              )),
        ),
      ),
    );
  }
}
