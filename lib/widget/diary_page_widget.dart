
import 'package:dream_diary/helpers/app_colors.dart';
import 'package:dream_diary/helpers/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bg_layout_widget.dart';

class DiaryPageWidget extends StatelessWidget {
  const DiaryPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BgLayoutWidget(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/search.svg')),
            const SizedBox(width: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.mulish(
                    textStyle: AppStyles.regularBodyGreyText14,
                    color: AppColors.gray
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Future<List<String>> getSuggestions(String pattern) async {
  List<String> matches = [];
  return matches;
}
