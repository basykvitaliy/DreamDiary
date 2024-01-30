import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    Key? key,
    this.height,
    required this.title,
    this.onTap,
    this.isDisabledBtn,
  }) : super(key: key);

  double? height;
  String title;
  final VoidCallback? onTap;
  bool? isDisabledBtn = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width, height ?? 60)),
          backgroundColor: !isDisabledBtn! ? MaterialStateProperty.all<Color>(AppColors.secondColor) : MaterialStateProperty.all<Color>(AppColors.bgElements),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ))),
      onPressed: !isDisabledBtn! ? onTap : null,
      child: Text(title,
          style: GoogleFonts.mulish(
            textStyle: AppStyles.regularMainText16,
            fontWeight: FontWeight.bold
          )),
    );
  }
}
