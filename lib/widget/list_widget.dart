import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListWidget extends StatelessWidget {
  ListWidget({
    super.key,
    required this.imgList,
    required this.titleList,
    required this.subTitleList,
    required this.onTap,
  });

  List<String> imgList = [];
  List<String> titleList = [];
  List<String> subTitleList = [];
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const PageScrollPhysics(),
      shrinkWrap: true,
      itemCount: imgList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onTap(index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.bgElements),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      width: 100,
                      height: 80,
                      child: Image.asset(
                        imgList[index],
                        scale: 4,
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleList[index],
                        style: GoogleFonts.mulish(
                          textStyle: AppStyles.regularWhiteText,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                      //Text(subTitleList[index], style: GoogleFonts.mulish(textStyle: AppStyles.regularWhiteText14, color: AppColors.gray)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
